#!/bin/bash
# Script to display passed arguments
echo "Script name: $0"
echo "Total arguments: $#"
echo "All arguments: $@"

args=("$@")

for index in "${!args[@]}"; do
  echo "Index: ${index}, Argument: ${args[$index]}"
done

echo "Done."