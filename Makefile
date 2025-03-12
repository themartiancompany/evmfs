# SPDX-License-Identifier: GPL-3.0-or-later

#    ----------------------------------------------------------------------
#    Copyright © 2024, 2025  Pellegrino Prevete
#
#    All rights reserved
#    ----------------------------------------------------------------------
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Affero General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Affero General Public License for more details.
#
#    You should have received a copy of the GNU Affero General Public License
#    along with this program.  If not, see <https://www.gnu.org/licenses/>.

SHELL=bash
PREFIX ?= /usr/local
SOLIDITY_COMPILER_BACKEND ?= solc
_PROJECT=evmfs
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
LIB_DIR=$(DESTDIR)$(PREFIX)/lib/$(_PROJECT)
MAN_DIR?=$(DESTDIR)$(PREFIX)/share/man
BUILD_DIR=build

DOC_FILES=\
  $(wildcard *.rst) \
  $(wildcard docs/*.md)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

_INSTALL_FILE=install -Dm644
_INSTALL_EXE=install -Dm755
_INSTALL_CONTRACTS_DEPLOYMENT_FUN:=\
  install-contracts-deployments-$(SOLIDITY_COMPILER_BACKEND)
_BUILD_TARGETS:=\
  contracts
_BUILD_TARGETS_ALL:=\
  all \
  $(_BUILD_TARGETS)
_CHECK_TARGETS:=\
  shellcheck
_CHECK_TARGETS_ALL:=\
  check \
  $(_CHECK_TARGETS)
_CLEAN_TARGETS_ALL:=\
  clean
_INSTALL_CONTRACTS_TARGETS:=\
  $(_INSTALL_CONTRACTS_DEPLOYMENT_FUN) \
  install-contracts-deployments-config \
  install-contracts-sources
_INSTALL_CONTRACTS_TARGETS_ALL:=\
  install-contracts \
  install-contracts-deployments-hardhat \
  install-contracts-deployments-solc \
  install-contracts-deployments-config \
  install-contracts-sources
_INSTALL_DOC_TARGETS:=\
  install-doc \
  install-man
_INSTALL_TARGETS:=\
  $(_INSTALL_DOC_TARGETS) \
  $(_INSTALL_CONTRACTS_TARGETS) \
  install-scripts
_INSTALL_TARGETS_ALL:=\
  install \
  $(_INSTALL_DOC_TARGETS) \
  $(_INSTALL_CONTRACTS_TARGETS_ALL) \
  install-scripts
_PHONY_TARGETS:=\
  $(_BUILD_TARGETS_ALL) \
  $(_CHECK_TARGETS_ALL) \
  $(_CLEAN_TARGETS_ALL) \
  $(_INSTALL_TARGETS_ALL)

all: $(_BUILD_TARGETS)

install: $(_INSTALL_TARGETS)

check: $(_CHECK_TARGETS)

install-contracts: $(_INSTALL_CONTRACTS_TARGETS)

clean:

	rm \
	  -rf \
	  "$(BUILD_DIR)"

shellcheck:

	shellcheck \
	  -s \
	    bash \
	  $(SCRIPT_FILES)

contracts:

	evm-make \
	  -v \
	  -C \
	    . \
	  -b \
	    "$(SOLIDITY_COMPILER_BACKEND)" \
	  -w \
	    "$(BUILD_DIR)"

install-contracts-sources:

	evm-make \
	  -v \
	  -C \
	    . \
	  -b \
	    "$(SOLIDITY_COMPILER_BACKEND)" \
	  -w \
	    "$(BUILD_DIR)" \
	  -o \
	    "$(LIB_DIR)" \
	  -l \
	    "n" \
	  install_sources

install-contracts-deployments-config:

	evm-make \
	  -v \
	  -C \
	    . \
	  -b \
	    "$(SOLIDITY_COMPILER_BACKEND)" \
	  -w \
	    "$(BUILD_DIR)" \
	  -o \
	    "$(LIB_DIR)" \
	  -l \
	    "n" \
	  install_deployments_config

install-contracts-deployments-solc:

	evm-make \
	  -v \
	  -C \
	    . \
	  -b \
	    "solc" \
	  -w \
	    "$(BUILD_DIR)" \
	  -o \
	    "$(LIB_DIR)" \
	  -l \
	    "n" \
	  install_deployments

install-contracts-deployments-hardhat:

	evm-make \
	  -v \
	  -C \
	    . \
	  -b \
	    "hardhat" \
	  -w \
	    "$(BUILD_DIR)" \
	  -o \
	    "$(LIB_DIR)" \
	  -l \
	    "n" \
	  install_deployments

install-doc:

	$(_INSTALL_FILE) \
	  $(DOC_FILES) \
	  -t $(DOC_DIR)
	mv \
	  "$(DOC_DIR)/README.md" \
	  "$(DOC_DIR)/docs.README.md"
	$(_INSTALL_FILE) \
	  "README.md" \
	  "$(DOC_DIR)/README.md"

install-scripts:

	$(_INSTALL_EXE) \
	  "$(_PROJECT)/check" \
	  "$(LIB_DIR)/check"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/publish" \
	  "$(LIB_DIR)/publish"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/get" \
	  "$(LIB_DIR)/get"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/lock" \
	  "$(LIB_DIR)/lock"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/verify" \
	  "$(LIB_DIR)/verify"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/index" \
	  "$(LIB_DIR)/index"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/$(_PROJECT)-get" \
	  "$(BIN_DIR)/$(_PROJECT)-get"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/$(_PROJECT)-publish" \
	  "$(BIN_DIR)/$(_PROJECT)-publish"
	$(_INSTALL_EXE) \
	  "$(_PROJECT)/$(_PROJECT)" \
	  "$(BIN_DIR)/$(_PROJECT)"

install-man:

	install \
	  -vdm755 \
	  "$(MAN_DIR)/man1"
	rst2man \
	  "man/$(_PROJECT).1.rst" \
	  "$(MAN_DIR)/man1/$(_PROJECT).1"
	rst2man \
	  "man/$(_PROJECT)-publish.1.rst" \
	  "$(MAN_DIR)/man1/$(_PROJECT)-publish.1"
	rst2man \
	  "man/$(_PROJECT)-publish.1.rst" \
	  "$(MAN_DIR)/man1/$(_PROJECT)-get.1"

.PHONY: $(_PHONY_TARGETS)
