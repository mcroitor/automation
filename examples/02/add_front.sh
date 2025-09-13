#!/bin/bash
# add an element in front of an array
array=(one two three)
array=(zero "${array[@]}")
echo "${array[@]}"