#!/bin/bash

if [ $# -ne 3 ]; then
    echo "Usage: ${0} <find_string> <replace_string> <grep_path>"
    exit 1
fi
find_string=${1}
replace_string=${2}
grep_path=${3}
tmp_file="./temp_file"
echo ${find_string}
echo ${replace_string}
echo ${grep_path}
echo "s/${find_string}/${replace_string}/g"
grep "${find_string}" ${3} -rn | awk -F '\\:' '{print $1}' > ${tmp_file}
while read line
do
    echo ${line}
    sed -i "s/${find_string}/${replace_string}/g" ${line}
done < ${tmp_file}
