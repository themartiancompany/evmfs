#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
_PROJECT=evmfs
_FS_NAME=FileSystem
_FS=contracts/$(_FS_NAME)
_SOLIDITY_COMPILER_BACKEND ?= solc
_FS_SOL=$(_FS).sol
_FS_JSON=$(_FS).json
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
LIB_DIR=$(DESTDIR)$(PREFIX)/lib/$(_PROJECT)

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

_INSTALL_FILE="install -Dm644"
_INSTALL_BIN="install -Dm755"
_INSTALL_CONTRACT_FUN="install-contracts-$(_SOLIDITY_COMPILER_BACKEND)"

all: contracts

check: shellcheck

shellcheck:
	shellcheck \
	  -s \
	    bash \
	  $(SCRIPT_FILES);

contracts:

	mkdir \
	  -p \
	  "$(_PROJECT)/build" \
	  "$(_PROJECT)/contracts-build";
	solidity-compiler \
	  -v \
	  -b \
	    "$(_SOLIDITY_COMPILER_BACKEND)" \
	  -w \
	    "$(_PROJECT)/contracts-build" \
	  -o \
	    "$(_PROJECT)/build" \
	  "$(_FS_SOL)";

install: $(_INSTALL_CONTRACT_FUN) install-scripts install-doc

install-contracts-solc:

	$(_INSTALL_FILE) \
	  "$(_PROJECT)/build/$(_FS_NAME).abi.json" \
	  "$(LIB_DIR)/$(_FS_NAME).abi.json";
	$(_INSTALL_FILE) \
	  "$(_PROJECT)/build/$(_FS_NAME).bytecode.json" \
	  "$(LIB_DIR)/$(_FS_JSON)";

install-contracts-hardhat:

	$(_INSTALL_FILE) \
	  "$(_PROJECT)/build/$(_FS_SOL)/$(_FS_NAME).json" \
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

.PHONY: check install install-doc install-scripts shellcheck
