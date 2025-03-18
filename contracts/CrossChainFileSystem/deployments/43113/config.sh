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
  ["1.0"]="0x6610ecC4429Dc11F2c62283Ca9Cdf45fc7C97cE1"
)
