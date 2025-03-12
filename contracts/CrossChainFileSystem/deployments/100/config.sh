#!/usr/bin/env bash

declare \
  -A \
  solc_version \
  evm_version \
  contract_address

solc_version=(
  ["1.0"]="0.8.28"
)
evm_version=(
  ["1.0"]="cancun"
)
contract_address=(
  ["1.0"]=""
)
