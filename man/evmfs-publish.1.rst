..
   SPDX-License-Identifier: AGPL-3.0-or-later

   ----------------------------------------------------------------------
   Copyright © 2024, 2025  Pellegrino Prevete

   All rights reserved
   ----------------------------------------------------------------------

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.

   You should have received a copy of the GNU Affero General Public License
   along with this program.  If not, see <https://www.gnu.org/licenses/>.


==============
evmfs-publish
==============

--------------------------------------------------------
Ethereum Virtual Machine File System publishing program
--------------------------------------------------------
:Version: evmfs-publish |version|
:Manual section: 1

Synopsis
========

evmfs-publish *[options]* *[files]*

Description
===========

Program used to publish (upload) files on the
Ethereum Virtual Machine File System (EVMFS).

Networks
========

The list of supported networks can be
consulted using evm-chains-info


Options
========

-m upload_method        It can be 'standalone' or 'simulate'.
-r retries_max          Maximum number of retries before
                        failing.
-T call_timeout         Maximum number of milliseconds before
                        declaring the call failed.
-L                      Skip check and publish and only lock
                        the file.
-G                      Explicitly skip file encoding.
-l chunk_length         Length of the encoded chunk.
                        On EVM networks one can write up to
                        around 24.000 characters
                        but on some network it seems it
                        is not possible to spend the amount
                        of gas needed to write that much.
-P  tasks_parallel      Tasks to perform in parallel.

Contract options
=================

-A fs_address           Address of the EVM file system
                        on the network.
-B ll_address           Address of the Length Lock contract
                        on the network.
-C ccfs_address         Address of the CrossChainFileSystem
                        contract on the network.
-V fs_version           Version of the target EVM file
                        system.

LibEVM options
===============

-u                      Whether to retrieve file system
                        address from user directory or custom
                        deployment.
-d deployments_dir      Contracts deployments directory.
-n network              EVM network chain ID or full name.

Credentials options
====================

-N wallet_name>         Wallet name.
-w wallet_path          Wallet path.
-p wallet_password      Wallet password.
-s wallet_seed          Wallet seed path.
-k api_key              Etherscan-like service key.

Application options
====================

-W  cache_dir           Work directory

-h                      Display help.
-c                      Enable color output
-v                      Enable verbose output


Bugs
====

https://github.com/themartiancompany/evmfs/-/issues

Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* evmfs-publish -h
* evmfs
* evmfs-get
* evm-wallet
* evm-chains-info

.. include:: variables.rst
