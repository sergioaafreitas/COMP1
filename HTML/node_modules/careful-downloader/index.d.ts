export interface Options {
  /**
   * Absolute URL to a checksums file, usually just a `.txt` containing
   * filenames and hashes.
   *
   * Either this option or `options.checksumHash` is required.
   */
  readonly checksumUrl?: string;

  /**
   * A single hash for the given downloaded file.
   * e.g. `abcd1234abcd1234abcd1234...`.
   *
   * Either this option or `options.checksumUrl` is required.
   */
  readonly checksumHash?: string;

  /**
   * Manually set the filename of the download, helpful if the one provided by
   * the server doesn't match the filename listed in the checksum file.
   *
   * @default Extracted from the download URL.
   */
  readonly filename?: string;

  /**
   * Use [`decompress`](https://github.com/kevva/decompress) to extract the
   * final download to the destination directory.
   *
   * @default false
   */
  readonly extract?: boolean;

  /**
   * Directory path relative to module where the validated download is saved or
   * extracted. Must be located within `process.cwd()` for security reasons.
   *
   * @default "./downloads"
   */
  readonly destDir?: string;

  /**
   * Delete any existing files in the destination directory before downloading.
   *
   * @default false
   */
  readonly cleanDestDir?: boolean;

  /**
   * The algorithm used by the checksum file. Available options are dependent on
   * the version of OpenSSL on the platform. Examples are 'SHA1', 'SHA256',
   * 'SHA512', 'MD5', etc.
   *
   * On recent releases of OpenSSL, `openssl list -digest-algorithms` will
   * display the available digest algorithms:
   *
   * https://nodejs.org/dist/latest-v14.x/docs/api/crypto.html#crypto_crypto_createhash_algorithm_options
   *
   * @default "sha256"
   */
  readonly algorithm?: string;

  /**
   * Tell the file stream to read the checksums as a string (hex) or binary.
   *
   * @default "hex"
   */
  readonly encoding?: BufferEncoding;
}

/**
 * Download a file and validate it against a checksum hash. Returns the path to
 * the validated file or folder (if it's safe).
 */
export default function downloader(downloadUrl: string, options: Options): Promise<string>;
