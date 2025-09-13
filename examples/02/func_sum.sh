#!/bin/bash
# examples/02/sum.sh

sum() {
  echo $(( $1 + $2 ))
}

count_params() {
  echo "total params: ${#}"

  echo params:

  for param in $@; do
    echo $param
  done
}

op1=3
op2=5

value=$(sum ${op1} ${op2})

count_params this is a param
echo "${op1} + ${op2} = ${value}"  # Output: Sum: 8
