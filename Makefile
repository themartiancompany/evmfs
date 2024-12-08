#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
_PROJECT=evmfs
_BUILD_DIR=build
_CONTRACTS_BUILD_DIR=contracts-build
_FS_NAME=FileSystem
_FS_SOL=$(_FS_NAME).sol
_FS_ABI=$(_FS_NAME).abi.json
_FS_BYTECODE=$(_FS_NAME).bytecode.json
_FS_JSON=$(_FS_NAME).json
_CONTRACTS_PATH=contracts
_FS_SOL_PATH=$(_CONTRACTS_PATH)/$(_FS_NAME)/$(_FS_SOL)
_FS_DEPLOYMENTS_PATH=$(_CONTRACTS_PATH)/$(_FS_NAME)/deployments
_SOLIDITY_COMPILER_BACKEND ?= solc
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
LIB_DIR=$(DESTDIR)$(PREFIX)/lib/$(_PROJECT)

DEPLOYED_NETWORKS=$(wildcard $(_FS_DEPLOYMENTS_PATH)/*)
DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

_INSTALL_FILE="install -Dm644"
_INSTALL_BIN="install -Dm755"
_INSTALL_CONTRACTS_FUN="install-contracts-$(_SOLIDITY_COMPILER_BACKEND)"
_INSTALL_TARGETS = ' \
  install-doc \
  install-contracts \
  install-scripts'
_PHONY_TARGETS  = ' \
  all \
  contracts \
  check \
  install \
  $(_INSTALL_TARGETS) \
  install-contracts-hardhat \
  install-contracts-solc \
  shellcheck'

all: contracts

install: $(_INSTALL_TARGETS)

check: shellcheck

shellcheck:

	shellcheck \
	  -s \
	    bash \
	  $(SCRIPT_FILES);

contracts:

	echo \
	  "$(_FS_SOL_PATH)";
	mkdir \
	  -p \
	  "$(_BUILD_DIR)" \
	  "$(_CONTRACTS_BUILD_DIR)";
	for _network in $(DEPLOYED_NETWORKS); do \
	  source \
	    $(_network)/config.sh; \
	  solidity-compiler \
	    -v \
	    -b \
	      "$(_SOLIDITY_COMPILER_BACKEND)" \
	    -C \
	      ${solc_version} \
	    -e \
	      "${evm_version}" \
	    -w \
	      "$(_PROJECT)/contracts-build" \
	    -o \
	      "$(_PROJECT)/build" \
	    "$(_FS_SOL_PATH)"; \
	done

install-contracts: $(INSTALL_CONTRACTS_FUN)

install-contracts-solc:

	for _network in $(DEPLOYED_NETWORKS); do \
	  $(_INSTALL_FILE) \
	    "$(_PROJECT)/build/$(_FS_ABI)" \
	    "$(LIB_DIR)/deployments/$(_FS_ABI)";
	  $(_INSTALL_FILE) \
	    "$(_PROJECT)/build/$(_FS_BYTECODE)" \
	    "$(LIB_DIR)/deployments/$(_FS_JSON)";
	done

install-contracts-hardhat:

	$(_INSTALL_FILE) \
	  "$(_PROJECT)/build/$(_FS_SOL)/$(_FS_JSON)" \
	  "$(LIB_DIR)/$(_FS_JSON)";

install-scripts:

	$(_INSTALL_BIN) \
	  "$(_FS_SOL)" \
	  "$(LIB_DIR)/$(_FS_SOL)";
	$(_INSTALL_BIN) \
	  "$(_PROJECT)/publish" \
	  "$(LIB_DIR)/publish";
	$(_INSTALL_BIN) \
	  "$(_PROJECT)/$(_PROJECT)-address" \
	  "$(BIN_DIR)/$(_PROJECT)-address";
	$(_INSTALL_BIN) \
	  "$(_PROJECT)/$(_PROJECT)-get" \
	  "$(BIN_DIR)/$(_PROJECT)-get";
	$(_INSTALL_BIN) \
	  "$(_PROJECT)/$(_PROJECT)-publish" \
	  "$(BIN_DIR)/$(_PROJECT)-publish";
	$(_INSTALL_BIN) \
	  "$(_PROJECT)/$(_PROJECT)" \
	  "$(BIN_DIR)/$(_PROJECT)";

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t $(DOC_DIR);

.PHONY: $(_PHONY_TARGETS)
