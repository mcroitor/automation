#!/bin/bash

str1="  text"
str2="text  "

result="${str2} ${str1}"
echo ${result}
echo "${result}"
echo "${result} has ${#result} chars"
echo "${result:3:5}"
echo "${result:3}"
echo "$str2 $str1"
echo '${str2} ${str1}'

replace1=${result/x/s}
replace2=${result//x/s}

echo "${replace1^^}"
echo "${replace2}"