# 🕵️‍♀️ careful-downloader

[![CI](https://github.com/jakejarvis/careful-downloader/actions/workflows/ci.yml/badge.svg)](https://github.com/jakejarvis/careful-downloader/actions/workflows/ci.yml)
[![npm](https://img.shields.io/npm/v/careful-downloader?logo=npm)](https://www.npmjs.com/package/careful-downloader)
[![MIT License](https://img.shields.io/github/license/jakejarvis/careful-downloader?color=red)](LICENSE)

Downloads a file and its checksums to a temporary directory, validates the hash, and optionally extracts it if safe.

## Install

```sh
npm install careful-downloader
# or...
yarn add careful-downloader
```

## Usage

```js
import downloader from "careful-downloader";

await downloader(
  "https://github.com/gohugoio/hugo/releases/download/v0.88.1/hugo_extended_0.88.1_Windows-64bit.zip",
  {
    checksumUrl: "https://github.com/gohugoio/hugo/releases/download/v0.88.1/hugo_0.88.1_checksums.txt",
    destDir: "vendor", // relative to process.cwd()
    algorithm: "sha256",
    extract: true,
  },
);
//=> '/Users/jake/src/carefully-downloaded/vendor/hugo.exe'
```

Instead of a `checksumUrl`, you can also simply provide a hash as a string via `checksumHash`:

```js
import downloader from "careful-downloader";

await downloader(
  "https://github.com/gohugoio/hugo/releases/download/v0.88.1/hugo_extended_0.88.1_Windows-64bit.zip",
  {
    checksumHash: "aaa20e258cd668cff66400d365d73ddc375e44487692d49a5285b56330f6e6b2",
    destDir: "vendor",
    algorithm: "sha256",
    extract: false, // the default
  },
);
//=> '/Users/jake/src/carefully-downloaded/vendor/hugo_extended_0.88.1_Windows-64bit.zip'
```

## API

### downloader(downloadUrl, options)

#### downloadUrl

Type: `string`

Absolute URL to the desired file to download.

#### options

Type: `object`

##### checksumUrl

Type: `string`

Absolute URL to a checksums file, usually just a `.txt` containing filenames and hashes [like this](https://github.com/gohugoio/hugo/releases/download/v0.88.1/hugo_0.88.1_checksums.txt):

```plaintext
27493d1903a41e2dd47edc76a79918d95dfbb31474380d3704322e47ffd11b74  hugo_0.88.1_Windows-32bit.zip
ad81192d188cb584a73074d3dea9350d4609a13ed5fccaafd229b424247e5890  hugo_0.88.1_Windows-64bit.zip
aaa20e258cd668cff66400d365d73ddc375e44487692d49a5285b56330f6e6b2  hugo_extended_0.88.1_Windows-64bit.zip
```

**Either this option or `checksumHash` is required.**

##### checksumHash

Type: `string`

A single hash for the given downloaded file, e.g. `abcd1234abcd1234abcd1234...`.

**Either this option or `checksumUrl` is required.**

##### filename

Type: `string`\
Default: Extracted from the download URL.

Manually set the filename of the download, helpful if the one provided by the server doesn't match the filename listed in the checksum file.

##### extract

Type: `boolean`\
Default: `false`

Use [`decompress`](https://github.com/kevva/decompress) to extract the final download to the destination directory (assuming it's a `.zip`, `.tar`, `.tar.gz`, etc.).

##### destDir

Type: `string`\
Default: `"./downloads"`

Directory path relative to module where the validated download is saved or extracted. **Must be located within `process.cwd()` for security reasons.**

##### cleanDestDir

Type: `boolean`\
Default: `false`

Delete any existing files in the destination directory before downloading.

##### algorithm

Type: `string`\
Default: `"sha256"`

The algorithm used by the checksum file. Available options are dependent on the version of OpenSSL on the platform. Examples are 'SHA1', 'SHA256', 'SHA512', 'MD5', etc.

On recent releases of OpenSSL, `openssl list -digest-algorithms` will display the available digest algorithms. [Read more about `crypto.createHash()`.](https://nodejs.org/dist/latest-v14.x/docs/api/crypto.html#crypto_crypto_createhash_algorithm_options)

##### encoding

Type: `string`\
Default: `"hex"`

## License

MIT
