import path from "path";
import fs from "fs-extra";
import { temporaryDirectory } from "tempy";
import decompress from "decompress";
import isPathInside from "is-path-inside";

import debug from "./lib/debug.js";
import download from "./lib/download.js";
import { checksumViaFile, checksumViaString } from "./lib/checksum.js";

export default async (downloadUrl, options) => {
  if (!options) {
    throw new Error("Missing the options object. See README for details.");
  }
  debug(`User-provided config: ${JSON.stringify(options)}`);

  // figure out which method we're using to validate (via a checksum file or straight-up hash)
  let checksumMethod;
  let checksumKey;
  if (options.checksumUrl) {
    // download and use checksum text file to parse and check
    checksumMethod = "file";
    checksumKey = options.checksumUrl;
  } else if (options.checksumHash) {
    // simply compare hash of file to provided string
    checksumMethod = "string";
    checksumKey = options.checksumHash;
  } else {
    throw new Error("Must provide either checksumUrl or checksumHash.");
  }
  debug(`Provided a ${checksumMethod} to validate against: '${checksumKey}'`);

  // normalize options and set defaults
  options = {
    filename: options.filename || new URL(downloadUrl).pathname.split("/").pop(),
    extract: !!options.extract,
    destDir: options.destDir ? path.resolve(process.cwd(), options.destDir) : path.resolve(process.cwd(), "downloads"),
    cleanDestDir: !!options.cleanDestDir,
    algorithm: options.algorithm || "sha256",
    encoding: options.encoding || "hex",
  };
  debug(`Normalized config with defaults: ${JSON.stringify(options)}`);

  // throw an error if destDir is outside of the module to prevent path traversal for security reasons
  if (!isPathInside(options.destDir, process.cwd())) {
    throw new Error(`destDir must be located within '${process.cwd()}', it's currently set to '${options.destDir}'.`);
  }

  // initialize temporary directory
  const tempDir = temporaryDirectory();
  debug(`Temp dir generated: '${tempDir}'`);

  try {
    // validate the checksum of the download
    let validated = false;

    if (checksumMethod === "file") {
      debug("Using a downloaded checksum file to validate...");

      const checksumFilename = new URL(checksumKey).pathname.split("/").pop();

      // simultaneously download the desired file and its checksums
      await Promise.all([
        download(downloadUrl, path.join(tempDir, options.filename)),
        download(checksumKey, path.join(tempDir, checksumFilename)),
      ]);

      // finally do the calculations
      validated = await checksumViaFile(
        path.join(tempDir, options.filename),
        path.join(tempDir, checksumFilename),
        options.algorithm,
        options.encoding,
      );
    } else if (checksumMethod === "string") {
      debug("Using a provided hash to validate...");

      // get the desired file
      await download(downloadUrl, path.join(tempDir, options.filename));

      // finally do the calculations
      validated = await checksumViaString(
        path.join(tempDir, options.filename),
        checksumKey,
        options.algorithm,
        options.encoding,
      );
    }

    // stop here if the checksum wasn't validated by either method
    if (!validated) {
      throw new Error(`Invalid checksum for '${options.filename}'.`);
    }

    // optionally clear the target directory of existing files
    if (options.cleanDestDir && await fs.access(options.destDir)) {
      debug(`Deleting contents of '${options.destDir}'`);
      await fs.emptyDir(options.destDir);
    }

    // ensure the target directory exists
    debug(`Ensuring target '${options.destDir}' exists`);
    await fs.ensureDir(options.destDir);

    if (options.extract) {
      // decompress download and move resulting files to final destination
      debug(`Extracting '${options.filename}' to '${options.destDir}'`);
      await decompress(path.join(tempDir, options.filename), options.destDir);
      return options.destDir;
    } else {
      // move verified download to final destination as-is
      debug(`Not told to extract; copying '${options.filename}' as-is to '${path.join(options.destDir, options.filename)}'`);
      await fs.copy(path.join(tempDir, options.filename), path.join(options.destDir, options.filename));
      return path.join(options.destDir, options.filename);
    }
  } finally {
    // delete temporary directory
    debug(`Deleting temp dir: '${tempDir}'`);
    await fs.remove(tempDir);
  }
};
