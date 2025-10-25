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
  ["1.0"]="0x1818f6803bF3d3786eb9d31A3fc2d2c75d30615E"
)
