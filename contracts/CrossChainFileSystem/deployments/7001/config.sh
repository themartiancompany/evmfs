#!/usr/bin/env bash

declare \
  -A \
  solc_version \
  evm_version \
  contract_address

solc_version=(
  ["1.0"]="0.7.5"
)
evm_version=(
  ["1.0"]="istanbul"
)
contract_address=(
  ["1.0"]="0x78bf4b05035bdbeee1c2048920e85bba424be188"
)
