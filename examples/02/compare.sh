#!/bin/bash

first="12"
second="9"

if [ ${first} -lt ${second} ]; then
    echo "less"
else
    echo "more"
fi

if [ ${first} \< ${second} ]; then
    echo "less"
else
    echo "more"
fi

empty=""
not_empty="not empty"

if [[ -z ${empty} && -z ${not_empty} ]]; then
    echo "empty"
else
    echo "not empty"
fi