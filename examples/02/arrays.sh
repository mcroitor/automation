#!/bin/bash

fruits=("apple" "banana" "kiwi")

echo ${fruits[@]}

fruits+=("watermelon")

echo ${fruits[@]}


size=${#fruits[@]}
fruits[$size]="grape"
fruits[6]="cherry"
fruits[-3]="mango"
fruits[1]="strawberry"

echo ${fruits[@]}
echo "${fruits[4]} ${fruits[6]}"
echo "total elements in fruits: ${#fruits[@]}"

for index in "${!fruits[@]}"; do
    echo "${index}: ${fruits[$index]}"
done