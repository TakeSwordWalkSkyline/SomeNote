#!/bin/bash
# 用于从http://192.168.130.42/ jenkins 上下载 AIBS_Routine AIBSService SpeechEnginebin 三个工具的脚本
#
if [ $# -lt 1 ]; then
    echo "Usage $0 24MM_AIBS_JENKINS_ID";
    exit -1;
fi

build_id=$1

if [ ${build_id} = "-h" ] || [ ${build_id} = "--help" ]; then
    echo "Usage $0 24MM_AIBS_JENKINS_ID";
    exit -1;
fi

#aibs_routine = $2;
#aibs_service = $3;
#speech_engine = $4;
echo -e "ready to begin download...\n"
download_aibs_routine="curl -X GET --user boloo:pachira http://jenkins.pachira.cn/view/TSP/job/TSPDecoder-AIBS/${build_id}/artifact/package/AIBS/x86-linux/bin/AIBS_Routine > AIBS_Routine"
download_aibs_service="curl -X GET --user boloo:pachira http://jenkins.pachira.cn/view/TSP/job/TSPDecoder-AIBS/${build_id}/artifact/package/AIBS/x86-linux/bin/AIBSService > AIBSService"
download_speech_engine="curl -X GET --user boloo:pachira http://jenkins.pachira.cn/view/TSP/job/TSPDecoder-AIBS/${build_id}/artifact/package/AIBS/x86-linux/bin/SpeechEnginebin > SpeechEnginebin"

if [ -e AIBS_Routine ]; then
    read -p ">>>>>>>>> AIBS_Routine is exit, overwrite it? [Y/n]" answer
    if [ ${answer} = "y" ] || [ ${answer} = "Y" ] || [ ${answer} = "yes" ] || [ ${answer} = "YES" ]; then
        echo ${download_aibs_routine}
        curl -X -GET --user boloo:pachira http://jenkins.pachira.cn/view/TSP/job/TSPDecoder-AIBS/${build_id}/artifact/package/AIBS/x86-linux/bin/AIBS_Routine > AIBS_Routine
        echo -e "\n"
    else
        echo -e "stop downloading AIBS_Routine\n";
    fi
else
    echo ${download_aibs_routine}
    curl -X -GET --user boloo:pachira http://jenkins.pachira.cn/view/TSP/job/TSPDecoder-AIBS/${build_id}/artifact/package/AIBS/x86-linux/bin/AIBS_Routine > AIBS_Routine
    echo -e "\n"
fi

if [ -e AIBSService ]; then
    read -p ">>>>>>>>> AIBSService is exit, overwrite it? [Y/n]" answer
    if [ ${answer} = "y" ] || [ ${answer} = "Y" ] || [ ${answer} = "yes" ] || [ ${answer} = "YES" ]; then
        echo ${download_aibs_service}
        curl -X GET --user boloo:pachira http://jenkins.pachira.cn/view/TSP/job/TSPDecoder-AIBS/${build_id}/artifact/package/AIBS/x86-linux/bin/AIBSService > AIBSService
        echo -e "\n"
    else
        echo -e "stop downloading AIBSService\n";
    fi
else
    echo ${download_aibs_service}
    curl -X GET --user boloo:pachira http://jenkins.pachira.cn/view/TSP/job/TSPDecoder-AIBS/${build_id}/artifact/package/AIBS/x86-linux/bin/AIBSService > AIBSService
    echo -e "\n"
fi

if [ -e SpeechEnginebin ]; then
    read -p ">>>>>>>>> SpeechEnginebin is exit, overwrite it? [Y/n]" answer
    if [ ${answer} = "y" ] || [ ${answer} = "Y" ] || [ ${answer} = "yes" ] || [ ${answer} = "YES" ]; then
        echo ${download_speech_engine}
        curl -X GET --user boloo:pachira http://jenkins.pachira.cn/view/TSP/job/TSPDecoder-AIBS/${build_id}/artifact/package/AIBS/x86-linux/bin/SpeechEnginebin > SpeechEnginebin
        echo -e "\n"
    else
        echo -e "stop downloading SpeechEnginebin\n";
    fi
else
    echo ${download_speech_engine}
    curl -X GET --user boloo:pachira http://jenkins.pachira.cn/view/TSP/job/TSPDecoder-AIBS/${build_id}/artifact/package/AIBS/x86-linux/bin/SpeechEnginebin > SpeechEnginebin
    echo -e "\n"
fi

if [ -e AIBS_Routine ]; then
    chmod +x AIBS_Routine
fi
if [ -e AIBSService ]; then
    chmod +x AIBSService
fi
if [ -e SpeechEnginebin ]; then
    chmod +x SpeechEnginebin
fi
echo "done..."
