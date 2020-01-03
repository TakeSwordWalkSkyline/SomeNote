Compile_Wakeup(){
    if [ ! -d Wakeup ];then
        git clone ssh://git@192.168.129.110/wakeup/Wakeup.git Wakeup
        if [ $? == 1 ];then
            echo "git clone Wakeup from git@192.168.129.110/wakeup/Wakeup.git failed";
            exit 1
        fi
    fi

    if [ ! -d Wakeup ];then
        echo "no Wakeup directory"
        exit 1
    fi

    cd Wakeup

    git checkout "${compile_wakeup}"
    if [ $? == 1 ];then
        echo "git checkout ${compile_wakeup} failed , so drop this build process"
        exit 1
    fi
    echo "git checkout ${compile_wakeup} for wakeup success"

    git pull
    if [ $? == 1 ];then
        echo "git pull origin ${compile_wakeup} failed,so drop this build process"
        exit 1
    fi
    echo "git pull origin ${compile_wakeup} for wakeup success"

    ./compile.sh ${platform} ${compile_pstt} ${compile_jni}
    if [ $? == 1 ];then
        echo "compile wakeup failed"
        exit 1
    fi

    if [ "x${platform}" != "xclean" ];then
        if [ ! -f package/${platform}/libwakeup.a ];then
            echo "compile wakeup failed,no libwakeup.a"
            exit 1
        fi
    fi

    cd ../
}

CopyLibraryHeader(){
    if [ ! -f Wakeup/package/${platform}/libwakeup.a ];then
        echo "no Wakeup/package/${platform}/libwakeup.a"
        exit 1
    fi
    cp Wakeup/package/${platform}/libwakeup.a AIBS/lib/libwakeup.a
    echo "Wakeup/package/${platform}/libwakeup.a -> AIBS/lib/libwakeup.a"

    cp Wakeup/lib/core/dep/libconfigure.a AIBS/lib/
    echo "Wakeup/lib/core/dep/libconfigure.a AIBS/lib/"

    cp Wakeup/package/include/dnn_score_api.h AIBS/include/
    cp Wakeup/package/include/api_convert.h AIBS/include/
    cp Wakeup/package/include/Vad.h AIBS/include/
    cp Wakeup/package/include/wakeup.h AIBS/include/
    cp Wakeup/package/include/FeatureExtractor.h AIBS/include/
}

BuildDecode(){
    build_path="build_${platform}"
    if [ -d ${build_path} ];then
        rm -rf ${build_path}
    fi
    mkdir ${build_path}
    cd ${build_path}
    cmake -DCMAKE_BUILD_TYPE="Release" ../Decode
    make
    cd ../
}

Compile_JNI(){
    cp build_${1}/Core/Session/libAIBS.a ./JNI/Decode/jni/
    cp AIBS/Core/include/aibs_engine_api.h ./JNI/Decode/jni/
    cp AIBS/Core/include/special_api.h ./JNI/Decode/jni/
    cp AIBS/include/wakeup.h ./JNI/Decode/jni/

    if [ -d package/${1}/jni ];then
        rm -rf package/${1}/jni
    fi
    mkdir -p package/${1}/jni

    cd JNI/Decode

    cp jni/Application.mk.${1} jni/Application.mk

    if [ -d libs ];then
        rm -rf libs
    fi
    if [ -d obj ];then
        rm -rf obj
    fi

    if which ndk-build 2>/dev/null;
    then
        ndk-build clean
        ndk-build NDK_DEBUG=1
    else
        /opt/android-ndk-r14b/ndk-build clean
        /opt/android-ndk-r14b/ndk-build NDK_DEBUG=1
    fi
    cd ../../

    cp -r JNI/Decode/libs package/${1}/jni/
    cp -r JNI/Decode/obj package/${1}/jni/
}

Package(){
    if [ ! -d package/include ];then
        mkdir package/include
    fi

    if [ ! -d package/demo ];then
        mkdir package/demo
    fi

    cp AIBS/include/decoder_api.h package/include
    cp AIBS/include/aibs_engine_api.h package/include
    cp AIBS/include/special_api.h package/include
    cp AIBS/FuzzyMatch/include/api_contact.h package/include
    cp AIBS/TTS/include/pachira_tts_api.h package/include
    cp AIBS/Asr2Code/include/Asr2Code.h package/include
    cp AIBS/include/wakeup.h ./package/include

    cp AIBS/include/bin/test_decoder.cpp package/demo
    cp AIBS/include/bin/DecodeTest_main.h package/demo
    cp AIBS/include/bin/DecodeTest_main.cpp package/demo
    cp AIBS/TTS/TTS_main.cpp package/demo
    cp AIBS/Demo/PachiraSpeechDemo_Telephone.cpp package/demo
    cp AIBS/Demo/PachiraSpeechDemo_Navigation.cpp package/demo

    mkdir $pack_dir/bin
    mkdir $pack_dir/lib

    BUILD_DIR=build_${1}
    cp $BUILD_DIR/Engine/bin/HawkDecoder package/${1}/bin
    cp $BUILD_DIR/Engine/bin/DelayTime package/${1}/bin
    cp $BUILD_DIR/Engine/bin/test_decoder package/${1}/bin
    cp $BUILD_DIR/Engine/bin/HawkTag package/${1}/bin
    cp $BUILD_DIR/Engine/bin/convert_ref package/${1}/bin
    cp $BUILD_DIR/Engine/bin/convert_nbest package/${1}/bin
    cp $BUILD_DIR/Engine/bin/Net package/${1}/bin
    cp $BUILD_DIR/Engine/bin/HawkTaglist package/${1}/bin
    cp $BUILD_DIR/Engine/bin/GenGrammarNet package/${1}/bin
    cp $BUILD_DIR/Engine/bin/encrypt_am package/${1}/bin
    cp $BUILD_DIR/Engine/bin/GenStaticGrammarNet package/${1}/bin
    cp $BUILD_DIR/Demo/PachiraSpeechDemo_Navigation package/${1}/bin
    cp $BUILD_DIR/Demo/PachiraSpeechDemo_Telephone package/${1}/bin
    if [ -f $BUILD_DIR/TTS/TTStest ];then
        cp $BUILD_DIR/TTS/TTStest package/${1}/bin
    fi
    if [ -f $BUILD_DIR/TTS/libtts.so ];then
        cp $BUILD_DIR/TTS/libtts.so package/${1}/lib
    fi
    cp $BUILD_DIR/Asr2Code/bin/Asr2CodeTest package/${1}/bin
    cp $BUILD_DIR/NLU/libNLU.a package/${1}/lib
    cp $BUILD_DIR/ULD/bin/uld_test package/${1}/bin
    cp $BUILD_DIR/NLU/bin/testNewApi package/${1}/bin
    cp $BUILD_DIR/NLU/bin/complie_grammar package/${1}/bin

    cp $BUILD_DIR/FuzzyMatch/bin/test_contact package/${1}/bin
    cp $BUILD_DIR/FuzzyMatch/bin/test_mark package/${1}/bin
    cp $BUILD_DIR/FuzzyMatch/bin/test_match package/${1}/bin

    cp $BUILD_DIR/Engine/libEngine.a package/${1}/lib

    if [ -f $BUILD_DIR/Engine/src/libdecoder_dynamic.so ];then
        cp $BUILD_DIR/Engine/src/libdecoder_dynamic.so package/${1}/lib
    fi
    cp ${BUILD_DIR}/FuzzyMatch/libFuzzyMatch.a package/${1}/lib
    cp $BUILD_DIR/Asr2Code/libAsr2Code.a package/${1}/lib
    cp AIBS/lib/libwakeup.a package/${1}/lib
    cp AIBS/lib/libconfigure.a package/${1}/lib
}
