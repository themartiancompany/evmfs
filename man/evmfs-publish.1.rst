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

Options
========

     -A <fs_address>        Address of the EVM file system
                            on the network.
                            Default: ${fs_address}
     -B <ll_address>        Address of the Length Lock contract
                            on the network.
                            Default: ${ll_address}
     -V <fs_version>        Version of the target EVM file
                            system.
                            Default: ${fs_version}
     -u                     Whether to retrieve file system
                            address from user directory or custom
                            deployment.
                            Default: ${user_level}
     -d <deployments_dir>   Contracts deployments directory.
                            Default: ${deployments_dir}
     -N <wallet_name>       Wallet name.
                            Default: ${wallet_name}
     -w <wallet_path>       Wallet path.
                            Default: ${wallet_path}
     -p <wallet_password>   Wallet password.
                            Default: ${wallet_password}
     -s <wallet_seed>       Wallet seed path.
                            Default: ${wallet_seed}
     -n <network>           EVM network name (${_networks[*]}).
                            Default: ${target_network}
     -k <api_key>           Etherscan-like service key.
                            Default: ${api_key}
     -m <upload_method>     It can be 'standalone' or 'simulate'.
                            Default: ${upload_method}
     -r <retries_max>       Maximum number of retries before
                            failing.
                            Default: ${retries_max}
     -L                     Skip check and publish and only lock
                            the file.
                            Default: ${lock_only}
     -P <tasks_parallel>    Tasks to perform in parallel.
                            Default: ${tasks_parallel}
     -C <cache_dir>         Work directory


Networks
========

The list of supported networks can be
consulted using evm-chains-info

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
