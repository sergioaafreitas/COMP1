import path from "path";
import crypto from "crypto";
import fs from "fs-extra";

import debug from "./debug.js";

// Check the checksum via a parsed text file containing one or more hashes.
export const checksumViaFile = async (desiredFile, checksumFile, algorithm, encoding) => {
  debug(`Validating checksum of '${desiredFile}' against hashes listed in '${checksumFile}' (algo: '${algorithm}', encoding: '${encoding}')`);

  const parsedHashes = await parseChecksumFile(checksumFile);
  debug(`All hashes pulled from the checksums file '${path.basename(checksumFile)}' : ${JSON.stringify(parsedHashes)}`);

  const generatedHash = await generateHashFromFile(desiredFile, algorithm, encoding);
  debug(`Generated a ${algorithm} hash of '${path.basename(desiredFile)}' => ${generatedHash}`);

  const correctHash = parsedHashes[path.basename(desiredFile)];
  debug(`Found '${path.basename(desiredFile)}' in '${path.basename(checksumFile)}', provided hash is: ${correctHash}`);

  if (!correctHash) {
    throw new Error(`'${path.basename(desiredFile)}' isn't listed in checksums file.`);
  }

  debug(`Checking if generated === provided... ${generatedHash} : ${correctHash}`);
  if (generatedHash !== correctHash) {
    debug(`Nope... ${generatedHash} !== ${correctHash}`);
    throw new Error(`Hash of '${path.basename(desiredFile)}' doesn't match the given checksum.`);
  }

  debug("Checksum validated via file, it's a match!");
  return true;
};

// Check the checksum via a provided hash.
export const checksumViaString = async (desiredFile, correctHash, algorithm, encoding) => {
  debug(`Validating checksum of '${desiredFile}' against provided hash '${correctHash}' (algo: '${algorithm}', encoding: '${encoding}')`);

  const generatedHash = await generateHashFromFile(desiredFile, algorithm, encoding);
  debug(`Generated a ${algorithm} hash of '${path.basename(desiredFile)}' => ${generatedHash}`);

  debug(`Checking if generated === provided... ${generatedHash} : ${correctHash}`);
  if (generatedHash !== correctHash) {
    debug(`Nope... ${generatedHash} !== ${correctHash}`);
    throw new Error(`Hash of '${path.basename(desiredFile)}' doesn't match the given checksum.`);
  }

  debug("Checksum validated via string, it's a match!");
  return true;
};

// Takes a path to a file and returns its hash.
const generateHashFromFile = async (file, algorithm, encoding) => {
  const fileBuffer = await fs.readFile(file);
  const hashSum = crypto.createHash(algorithm);
  hashSum.update(fileBuffer);

  return hashSum.digest(encoding);
};

// Largely adapted from sumchecker:
// https://github.com/malept/sumchecker/blob/28aed640a02787490d033fda56eaee30e24e5a71/src/index.ts#L97
const parseChecksumFile = async (checksumFile) => {
  // read the text file holding one or more checksums
  const data = await fs.readFile(checksumFile, { encoding: "utf8" });

  // https://regexr.com/67k7i
  const lineRegex = /^([\da-fA-F]+)[ \t]+[*]?(.+)$/;

  // extract each file and its hash into this object
  const checksums = {};

  // loop through each line (should be one file & hash each)
  let lineNumber = 0;
  for (const line of data.trim().split(/[\r\n]+/)) {
    lineNumber += 1;

    // parse the current line using the regex pattern above
    const parsedLine = lineRegex.exec(line);

    if (parsedLine === null) {
      // didn't match regex
      debug(`Could not parse line number ${lineNumber}`);
      throw new Error(lineNumber, line);
    } else {
      parsedLine.shift();

      // save the current file & hash in the checksums object
      const [hash, file] = parsedLine;
      checksums[file] = hash;
    }
  }

  // send back the cleaned up object of filenames & hashes
  return checksums;
};
