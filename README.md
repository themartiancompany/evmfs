[comment]: <> (SPDX-License-Identifier: AGPL-3.0)

[comment]: <> (-------------------------------------------------------------)
[comment]: <> (Copyright © 2024, 2025  Pellegrino Prevete)
[comment]: <> (All rights reserved)
[comment]: <> (-------------------------------------------------------------)

[comment]: <> (This program is free software: you can redistribute)
[comment]: <> (it and/or modify it under the terms of the GNU Affero)
[comment]: <> (General Public License as published by the Free)
[comment]: <> (Software Foundation, either version 3 of the License.)

[comment]: <> (This program is distributed in the hope that it will be useful,)
[comment]: <> (but WITHOUT ANY WARRANTY; without even the implied warranty of)
[comment]: <> (MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the)
[comment]: <> (GNU Affero General Public License for more details.)

[comment]: <> (You should have received a copy of the GNU Affero General Public)
[comment]: <> (License along with this program.)
[comment]: <> (If not, see <https://www.gnu.org/licenses/>.)

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

Public file system's contracts' deployment addresses on
selected blockchain networks can be found in the 
`contracts/deployments` directory in the source
tree and are configured into the program at install time.

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
  http://www.humaninstrumentalityproject.org)
and of the
[Ur](
  https://github.com/themartiancompany/ur)
application store for Life and DogeOS.

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
