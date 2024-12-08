#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
_PROJECT=evmfs
_FS_NAME=FileSystem
_FS_SOL=$(_FS_NAME).sol
_FS_ABI=$(_FS_NAME).abi.json
_FS_BYTECODE=$(_FS_NAME).bytecode.json
_FS_JSON=$(_FS_NAME).json
_CONTRACTS_PATH=contracts
_FS_DIR=$(_CONTRACTS_PATH)/$(_FS_NAME)
_FS_SOL_PATH=$(_FS_DIR)/$(_FS_SOL)
_FS_DEPLOYMENTS_DIR=$(_FS_DIR)/deployments
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
LIB_DIR=$(DESTDIR)$(PREFIX)/lib/$(_PROJECT)
BUILD_DIR=build
CONTRACTS_BUILD_WORK_DIR=contracts-build
SOLIDITY_COMPILER_BACKEND ?= solc

DEPLOYED_NETWORKS_CONFIG_DIR=$(wildcard $(_FS_DEPLOYMENTS_DIR)/*)
DEPLOYED_NETWORKS=$(notdir $(DEPLOYED_NETWORKS_CONFIG_DIR))
DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

_INSTALL_FILE=install -Dm644
_INSTALL_BIN=install -Dm755
_INSTALL_CONTRACTS_FUN=install-contracts-$(SOLIDITY_COMPILER_BACKEND)
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

	for _network in $(DEPLOYED_NETWORKS); do \
	  _deployment_dir="$(_FS_DEPLOYMENTS_DIR)/$${_network}"; \
	  _config_file="$${_deployment_dir}/config.sh"; \
	  _build_dir="$(BUILD_DIR)/$${_network}"; \
	  _work_dir="$(BUILD_DIR)/$${_network}/build"; \
	  mkdir \
	    -p \
	    "$${_work_dir}"; \
	  source \
	    "$${_config_file}"; \
	  solidity-compiler \
	    -v \
	    -b \
	      "$(_SOLIDITY_COMPILER_BACKEND)" \
	    -C \
	      $${solc_version} \
	    -e \
	      "$${evm_version}" \
	    -w \
	      "$${_work_dir}" \
	    -o \
	      "$${_build_dir}" \
	    -l \
	    "$(_FS_SOL_PATH)"; \
	done

install-contracts: $(INSTALL_CONTRACTS_FUN)

install-contracts-solc:

	for _network in $(DEPLOYED_NETWORKS); do \
	  _build_dir="$(BUILD_DIR)/$${_network}"; \
	  $(_INSTALL_FILE) \
	    "$${_build_dir}/$(_FS_ABI)" \
	    "$(LIB_DIR)/$${_network}/$(_FS_ABI)";
	  $(_INSTALL_FILE) \
	    "$${_build_dir}/$(_FS_BYTECODE)" \
	    "$(LIB_DIR)/$${_network}/$(_FS_JSON)";
	done

install-contracts-hardhat:

	for _network in $(DEPLOYED_NETWORKS); do \
	  _build_dir="$(BUILD_DIR)/$${_network}"; \
	  $(_INSTALL_FILE) \
	    "$${_build_dir}/$(_FS_SOL)/$(_FS_JSON)" \
	    "$(LIB_DIR)/$${_network}/$(_FS_JSON)"; \
	done

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
