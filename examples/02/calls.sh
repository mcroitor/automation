#!/bin/bash
args=$@

timestamp=$(date +%Y%m%d%H%M%S)
filename="file_${timestamp}.txt"

touch $filename

for arg in ${args[@]}; do
    echo $arg >> $filename
done