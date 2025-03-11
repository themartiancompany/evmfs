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

-A fs_address           Address of the EVM file system
                        on the network.
-B ll_address           Address of the Length Lock contract
                        on the network.
-C ccfs_address         Address of the CrossChainFileSystem
                        contract on the network.
-V fs_version           Version of the target EVM file
                        system.
-u                      Whether to retrieve file system
                        address from user directory or custom
                        deployment.
-d deployments_dir      Contracts deployments directory.
-N wallet_name>         Wallet name.
-w wallet_path          Wallet path.
-p wallet_password      Wallet password.
-s wallet_seed          Wallet seed path.
-n network              EVM network chain ID or full name.
-k api_key              Etherscan-like service key.
-m upload_method        It can be 'standalone' or 'simulate'.
-r retries_max          Maximum number of retries before
                        failing.
-L                      Skip check and publish and only lock
                        the file.
-P  tasks_parallel      Tasks to perform in parallel.
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
