#!/bin/bash

name=12.4
another=27.1

sum=$(echo "${name} + ${another}" | bc)
echo "${name} + ${another} = ${sum}" 