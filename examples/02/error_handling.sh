#!/bin/bash

mkdir sampledir

if [ $? -ne 0 ]; then
    echo Cant create directory, ne
    exit
else
    echo directory is created successfully, ne
fi

(
    mkdir sampledir
) && (
    echo directory is created successfully, ops
) || (
    echo failed to create directory, ops
)