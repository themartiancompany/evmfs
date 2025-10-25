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
  ["1.0"]="0xe271B866122f9d6B9a18C4A16656D32532c7e4a5"
)
