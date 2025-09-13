#!/bin/bash

str=without_quotes
str1='  Text'
str2="Text  "     

echo $str
echo '${str2} ${str1}'
echo "${str2} ${str1}"

result="${str2} ${str1}"
echo ${result}
echo '${result}'
echo "${result}"

echo "${result} has ${#result} chars"

echo "\`${result:3:5}\`"
echo "\`${result:3}\`"

replace1=${result/x/s}
replace2=${result//x/s}

echo "${replace1^^}"
echo "${replace2,,}"