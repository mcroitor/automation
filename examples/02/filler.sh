#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Usage: $0 output_file word1 [word2 ... wordN]"
  exit 1
fi

output_file=$1
shift
words=("$@")

if [ ! -f $output_file ]; then
    touch $output_file
fi

if [ $? -ne 0 ]; then
    echo "cant create file!"
    exit 1
fi

if [ ! -w $output_file ]; then
    echo "dont have permissions!"
    exit 1
fi

for word in ${words[*]}; do
    echo "${word}" >> $output_file
done

echo "Done filling '${output_file}' file!"