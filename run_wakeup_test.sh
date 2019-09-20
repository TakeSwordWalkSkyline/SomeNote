#!/bin/bash

top_dir=${PWD}

if [ $# -eq 4 ]; then
    tool_path="${1}/test_term_wakeup"
    case_list="${2}"
    model_path="${3}"
    work_space="${4}"
else
    echo "Usage: ${0} tool_dir case_list model work_space"
    exit 1
fi

cp ${tool_path} . 

cat ${case_list} | while read line
do 
    #以tab为分隔符分割字符串
    audio_list=${line%%	*}
    wakeup_word=${line#*	}
    wakeup_word=${wakeup_word%	*}
    wakeup_scene=${line##*	}
    echo ${audio_list}
    echo ${wakeup_word}
    echo ${wakeup_scene}
    mkdir -p "${top_dir}/${work_space}/${wakeup_word}"
    cd ${top_dir}/${work_space}/${wakeup_word}
    echo "run ../../test_term_wakeup -f ${audio_list} -m ${model_path} --${wakeup_scene}"
    ../../test_term_wakeup -f ${audio_list} -m ${model_path} --${wakeup_scene}
    cd ${top_dir}
done
