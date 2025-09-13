#!/bin/bash

if [ "$#" -lt 2 ]; then
  echo "Usage: $0 output_file input_file1 [input_file2 ...]"
  exit 1
fi

output_file="${1}"
shift
cat "$@" > "${output_file}"
if [ "$?" -eq 0 ]; then
  echo "Files merged into ${output_file}"
else
  echo "Error merging files"
fi