#!/bin/bash

#/data1/wangxin/gitlab/HawkServer/build/configure/libconfigure.a \
#/data1/wangxin/gitlab/HawkServer/build/decoder/score/libscore.a \

cp  /data1/wangxin/gitlab/HawkServer/build/vad/libvad.a \
    /data1/wangxin/gitlab/HawkServer/build/convert/libconvert.a \
    /data1/wangxin/gitlab/HawkServer/build/decoder/feature/libfeature.a \
    /data1/wangxin/gitlab/HawkServer/build/grammar/libgrammar.a \
    /data1/wangxin/gitlab/Wakeup/lib/core/dep/

cp  /data1/wangxin/gitlab/HawkServer/src/convert/include/api_convert.h \
    /data1/wangxin/gitlab/HawkServer/src/include/dnn_score_api.h \
    /data1/wangxin/gitlab/HawkServer/src/decoder/feature/include/FeatureExtractor.h \
    /data1/wangxin/gitlab/HawkServer/src/vad/include/Vad.h \
    /data1/wangxin/gitlab/HawkServer/src/include/MarkApi.h \
    /data1/wangxin/gitlab/Wakeup/lib/core/include

#cp  /data1/wangxin/gitlab/HawkServer/build/base/libbase.a \
#    /data1/wangxin/gitlab/Wakeup/lib/core/dep/

cp  /data1/wangxin/gitlab/HawkServer/src/include/mem_pool.h \
    /data1/wangxin/gitlab/HawkServer/src/include/pachira_mem.h \
    /data1/wangxin/gitlab/HawkServer/src/include/StringHash.h \
    /data1/wangxin/gitlab/HawkServer/src/include/feat_api.h \
    /data1/wangxin/gitlab/HawkServer/src/include/dlog.h \
    /data1/wangxin/gitlab/HawkServer/src/include/PhoneTrie.h \
    /data1/wangxin/gitlab/HawkServer/src/include/inthash.h \
    /data1/wangxin/gitlab/Wakeup/lib/include
