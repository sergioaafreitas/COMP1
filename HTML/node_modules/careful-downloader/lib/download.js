import stream from "stream";
import { promisify } from "util";
import fs from "fs-extra";
import got from "got";

import debug from "./debug.js";

// Download any file to any destination. Returns a promise.
export default async (url, dest) => {
  debug(`Downloading '${url}' to '${dest}'`);

  // get remote file and write locally
  const pipeline = promisify(stream.pipeline);
  const download = pipeline(
    got.stream(url, { followRedirect: true }), // GitHub releases redirect to unpredictable URLs
    fs.createWriteStream(dest),
  );

  return download;
};
