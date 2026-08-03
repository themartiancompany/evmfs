[comment]: <> (SPDX-License-Identifier: AGPL-3.0)

[comment]: <> (----------------------------------------------------)
[comment]: <> (Copyright © 2024, 2025, 2026)
[comment]: <> (            Pellegrino Prevete)
[comment]: <> (All rights reserved)
[comment]: <> (----------------------------------------------------)

[comment]: <> (This program is free software: you can redistribute)
[comment]: <> (it and/or modify it under the terms of the)
[comment]: <> (GNU Affero General Public License as published)
[comment]: <> (by the Free Software Foundation, either version)
[comment]: <> (3 of the License.)

[comment]: <> (This program is distributed in the hope that it)
[comment]: <> (will be useful, but WITHOUT ANY WARRANTY;)
[comment]: <> (without even the implied warranty of)
[comment]: <> (MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.)
[comment]: <> (See the GNU Affero General Public License)
[comment]: <> (for more details.)

[comment]: <> (You should have received a copy of the)
[comment]: <> (GNU Affero General Public License)
[comment]: <> (with this program.)
[comment]: <> (If not, see <https://www.gnu.org/licenses/>.)

# Ethereum Virtual Machine File System (`evmfs`)

<div
   align="center">
  <img
     src="https://raw.githubusercontent.com/themartiancompany/evmfs-data/2fb357f70c07ab25ef5c74b6558d23e63f8a26e2/evmfs.png"
     width="500"
     align="center"
  />
</div>

Reference implementations of the Ethereum Virtual Machine File System (EVMFS).

### Quick overview

The Ethereum Virtual Machine File System is a multi-level distributed,
network-independent, cross-network, uncensorable, undeletable,
permissionless file system running on Ethereum Virtual Machine-compatible networks.

Links pointing to the file system resources are structured in the following way:

```
evmfs://<evm-network-id>/<evmfs-contract-address>/<user-namespace>/<file-hash>
```

Files can be published by running

```bash
evmfs \
  publish \
    [files]
```

and retrieved with

```bash
evmfs \
  get \
    <uri>
```

Public file system's contracts' deployment addresses on
selected blockchain networks can be found in the 
`contracts/deployments` directory in the source
tree and are configured into the program at install time.

The file system currently has public deployments
on around 4% of all Ethereum Virtual Machine
compatible blockchains networks.

Options for user-defined deployments are discussed in
the documentation.

Extra to the command-line utility, a standalone
super simple Bash graphical interface using Zenity
has been made available in the
[evmfs-zenity](
  https://github.com/themartiancompany/evmfs-zenity)
repository.

![evmfs-zenity](
  https://github.com/themartiancompany/evmfs-zenity/blob/master/media/evmfs-get-zenity.jpg)

The EVMFS is a core component of the
[Human Instrumentality Project](
  http://www.humaninstrumentalityproject.org),
of the
[Ur](
  https://github.com/themartiancompany/ur)
application store for Life and
[DogeOS](
  https://github.com/themartiancompany/dogeos)
and it is a pre-requirement for the
[*OpenPGP on Ethereum*](
  https://github.com/themartiancompany/evm-gnupg)
specification and the
[*EVM Contracts Source Index*](
  https://github.com/themartiancompany/evm-contracts-source-index),
which allows Ethereum clients to perform
contracts source verification on-chain natively
without using a centralized explorer service.

The EVMFS tree implementation is also known as the
[*Git on Ethereum*](
  https://github.com/themartiancompany/evm-git)
specification.

### Installation

The EVMFS has been officially published on the
[Ur](
  https://github.com/themartiancompany/ur),
the uncensorable, distributed, permissionless
Life and DogeOS user repository and application store,
so it can be seamlessly installed by typing

```bash
ur evmfs
```

Since the EVMFS is actually an Ur dependency, if
you're coming from a system not integrating
or packaging the Ur, you may want to install
a binary build from the
[Fur](
  https://github.com/themartiancompany/fur),
the fallback user repository.

#### Building from source

The project can be built and installed with GNU make.

```
cd \
  evmfs
make
make \
  install
```

A full list of its software dependencies can be found in its
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

Notes and other documentation are in the
[`docs`](
  docs)
source tree directory and installed onto the
`<data_dir>/doc/evmfs` directory.

You can consult the manual from an online mirror of this
repository. The `rst` source files are located in the `man`
directory.

## License

The Ethereum Virtual File System is released under the terms of the
GNU Affero General Public License Version 3.
