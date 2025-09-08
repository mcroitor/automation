#!/bin/bash

my_function() {
  local local_var="I am local"
  global_var="I am global"
  echo "${local_var}"
}

my_function
# echo "${local_var}"  # Error: local_var is not defined outside the function
echo "${global_var}"  # Выведет: I am global