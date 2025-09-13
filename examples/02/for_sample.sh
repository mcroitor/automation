#!/bin/bash

fruits=("apple" "banana" "kiwi")

fruits+=("watermelon")

fruits[6]="cherry"
fruits[1]="strawberry"

for fruit in ${fruits[@]}; do
    echo $fruit
done

for index in ${!fruits[@]}; do
    echo "fruit [${index}] = ${fruits[$index]}"
done