# Ethereum Virtual Machine File System Architecture

## Overview

The file system itself consists of a set of Solidity smart contracts.
Each network address on the network is assigned a namespace in which
files are uniquely identified by their SHA-256 hash.
Files are stored onto the blockchain as integer mappings of
base64 encoded text strings.
After having been correctly uploaded, files are locked to avoid tampering.

### Version 1.0

Version 1.0 is defined through the `FileSystem` and `LengthLock`
contracts.
