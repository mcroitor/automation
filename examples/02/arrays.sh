#!/bin/bash

fruits=("apple" "banana" "kiwi")

echo ${fruits[*]}

fruits+=("watermelon")

echo ${fruits[@]}

fruits[6]="cherry"
fruits[1]="strawberry"

echo ${fruits[@]}
echo "${fruits[4]} ${fruits[6]}"
echo "total elements in fruits: ${#fruits[@]}"