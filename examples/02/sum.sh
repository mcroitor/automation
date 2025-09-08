#!/bin/bash
# examples/02/sum.sh

sum() {
  echo $(( $1 + $2 ))
}
value=$(sum 3 5)
echo "Sum: ${value}"  # Output: Sum: 8