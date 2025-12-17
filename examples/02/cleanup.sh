#!/bin/bash

# First argument — directory to clean
DIR=$1
shift
EXTENSIONS=$@

# Check: was a directory specified
if [ -z "$DIR" ]; then
    echo "Error: no directory specified"
    exit 1
fi

# Check: does the directory exist
if [ ! -d "$DIR" ]; then
    echo "Error: directory does not exist"
    exit 1
fi

# If no extensions were specified — use .tmp by default
if [ -z "$EXTENSIONS" ]; then
    EXTENSIONS=".tmp"
fi

COUNT=0
# Loop through each extension and remove matching files
for EXT in $EXTENSIONS; do
    FILES=$(find "$DIR" -type f -name "*$EXT")
    for FILE in $FILES; do
        rm -f "$FILE"    # Delete the file
        COUNT=$((COUNT+1))  # Increment counter
    done
done

# Final output
echo "Deleted $COUNT files."