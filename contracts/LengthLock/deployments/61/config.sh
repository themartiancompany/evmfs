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
  ["1.0"]="0xb0e225407f01658b3f42536D1615B3679708e1d8"
)
