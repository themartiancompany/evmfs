#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
_PROJECT=evmfs
_FS=contracts/FileSystem
_FS_SOL=$(_FS).sol
_FS_JSON=$(_FS).json
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/$(_PROJECT)
BIN_DIR=$(DESTDIR)$(PREFIX)/bin
LIB_DIR=$(DESTDIR)$(PREFIX)/lib/$(_PROJECT)

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard $(_PROJECT)/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-scripts install-doc

install-scripts:

	mkdir -p "$(_PROJECT)/build" "$(_PROJECT)/contracts-build"
	install -vDm 755 "$(_FS_SOL)" "$(LIB_DIR)/$(_FS_SOL)"
	solidity-compiler -v -w "$(_PROJECT)/contracts-build" -o "$(_PROJECT)/build" "$(_FS_SOL)"
	install -vDm 644 "$(_PROJECT)/build/$(_FS_SOL)/FileSystem.json" "$(LIB_DIR)/$(_FS_JSON)"
	install -vDm 755 "$(_PROJECT)/publish" "$(LIB_DIR)/publish"
	install -vDm 755 "$(_PROJECT)/$(_PROJECT)-address" "$(BIN_DIR)/$(_PROJECT)-address"
	install -vDm 755 "$(_PROJECT)/$(_PROJECT)-get" "$(BIN_DIR)/$(_PROJECT)-get"
	install -vDm 755 "$(_PROJECT)/$(_PROJECT)-publish" "$(BIN_DIR)/$(_PROJECT)-publish"
	install -vDm 755 "$(_PROJECT)/$(_PROJECT)" "$(BIN_DIR)/$(_PROJECT)"

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

.PHONY: check install install-doc install-scripts shellcheck
