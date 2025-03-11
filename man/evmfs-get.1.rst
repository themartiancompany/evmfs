==============
evmfs-get
==============

--------------------------------------------------------
Ethereum Virtual Machine File System download program
--------------------------------------------------------
:Version: evmfs-get |version|
:Manual section: 1

Synopsis
========

evmfs-get *[options]* *-o* *output-file* *address*

Description
===========

Program used to retrieve files from the
Ethereum Virtual Machine File System (EVMFS).

Options
=======

-o output_file          Name of the file in which to save
                        the downloaded resource.
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
-w wallet_path>         Wallet path.
-p wallet_password>     Wallet password.
-s wallet_seed          Wallet seed path.
-n network              EVM network name (${_networks[*]}).
-k api_key              Etherscan-like service key.
-m call_method          Can be standalone or 'bulk'.
-r retries_max          Maximum number of retries before
                        failing.
-P tasks_parallel       Tasks to perform in parallel.
-W cache_dir            Location where to temporary store
                        the downloaded resource chunks.

-h                      This message.
-c                      Enable color output
-v                      Enable verbose output


Copyright
=========

Copyright Pellegrino Prevete. AGPL-3.0.

See also
========

* evmfs-get -h
* evmfs
* evmfs-publish

.. include:: variables.rst
