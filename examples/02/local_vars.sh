#!/bin/bash
# local variables in bash functions

my_function() {
  local var="I am local"
  echo "$var"
}

my_function  # Outputs: I am local
echo "$var"  # Outputs nothing, as var is not defined in this scope