#!/bin/bash

wav_dir=""
list_dir=""
if [ $# -eq 3 ]; then
    wav_dir=$(realpath ${1})
    list_dir=$(realpath ${2})
else
    echo "Generate case list from given audio file directory."
    echo
    echo "Usage: ${0} <audio_path> <list_dir> <final_list>"
    exit 1
fi

if [ ! -d ${wav_dir} ]; then
    echo "No such directory: ${wav_dir}"
    exit 1
fi

if [ -f ${list_dir} ]; then
    echo "The second argument is supposed to be a directory: ${wav_dir}"
    exit 1
fi

if [ ! -d ${list_dir} ]; then
    echo "Create directory: ${wav_dir}"
    mkdir -p ${list_dir}
fi

final_list="./final_list/${3}"
for dir in $(find ${1} -mindepth 1 -maxdepth 1 -type d); do
    list_name="${list_dir}/$(basename ${dir}).txt"
    find ${dir} -type f -name '*.wav' > ${list_name}
    cat ${list_name} >> ${final_list}
done
