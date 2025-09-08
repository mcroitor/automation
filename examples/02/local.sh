#!/bin/bash

my_function() {
  local local_var="I am local"
  global_var="I am global"
  echo "${local_var}"
}

my_function
# echo "${local_var}"  # Ошибка: local_var не определена вне функции
echo "${global_var}"  # Выведет: I am global