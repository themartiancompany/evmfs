# Ethereum Virtual Machine File System

Reference implementation of the Ethereum Virtual Machine File System (EVMFS).

### Quick overview

The Ethereum Virtual Machine File System is a multi-level distributed,
network-independent, cross-network, uncensorable, undeletable,
permissionless file system running on Ethereum Virtual Machine-compatible networks.

Links pointing to the file system resources are structured in the following way:

```
evmfs://<evm_network_id>/<evmfs_contract_address>/<user_namespace>/<file_hash>
```

Files can be published by running

```bash
evmfs \
  publish \
    [target_files]
```

and retrieved with

```bash
evmfs \
  get \
    <evmfs_uri>
```

### Installation

The project can be built and installed with GNU make.
A list of its software dependencies can be found in its
[Ur](
  https://github.com/themartiancompany/ur) uncensorable
user repository and application store universal recipe,
hosted on the file system itself.
An HTTP mirror is provided on The Martian Company's
[Github](
  https://github.com/themartiancompany/evmfs-ur).

### Documentation

Upon installation, manual can be consulted by typing:

```bash
  man \
    evmfs
```

Notes and other documentation are in the `docs` source
tree directory and installed onto the `<data_dir>/doc/evmfs`
directory.

## License

The Ethereum Virtual File System is released under the terms of the
GNU Affero General Public License Version 3.
