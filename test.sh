#!/usr/bin/env bash

_test_fun() {
  true
}

for _arg in "$@"; do
	echo "${_arg}"
done
