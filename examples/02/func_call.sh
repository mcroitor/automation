#!/bin/bash
# examples/02/sum.sh

sum() {
  echo $(( $1 + $2 ))
}

caller() {
  echo $($1 $2 $3)
}

op1=3
op2=5

value=$(caller sum ${op1} ${op2})

echo "${op1} + ${op2} = ${value}"  # Output: Sum: 8
