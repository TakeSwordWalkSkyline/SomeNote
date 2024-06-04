#!/bin/bash

#Wakeup
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/dlog.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/dlog.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/pachira_mem.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/pachira_mem.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/feat_api.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/feat_api.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/FeatureExtractor.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/FeatureExtractor.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/grammar/include/GrammarAPI.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/GrammarAPI.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/inthash.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/inthash.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/mem_pool.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/mem_pool.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/pachira_encrypt_api.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/pachira_encrypt_api.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/PhoneTrie.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/PhoneTrie.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/stack.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/stack.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/dnn_score_api.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/dnn_score_api.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/convert/include/api_convert.h \
      /home/wangxin/programming/gitlab/Wakeup/lib/include/api_convert.h
ln -s /home/wangxin/programming/gitlab/HawkServer/build/vad/libvad.a \
      /home/wangxin/programming/gitlab/Wakeup/lib/core/dep/x86-linux/libvad.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/mark/libmark.a \
      /home/wangxin/programming/gitlab/Wakeup/lib/core/dep/x86-linux/libmark.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/base/libbase.a \
      /home/wangxin/programming/gitlab/Wakeup/lib/core/dep/x86-linux/libbase.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/decoder/feature/libfeature.a \
      /home/wangxin/programming/gitlab/Wakeup/lib/core/dep/x86-linux/libfeature.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/decoder/score/libscore.a \
      /home/wangxin/programming/gitlab/Wakeup/lib/core/dep/x86-linux/libscore.a

#TSPDecoder
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/pachira_mem.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/pachira_mem.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/convert/include/api_convert.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/api_convert.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/CloudService/include/CloudService.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/CloudService.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/convertdigit/include/ConvertDigit.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/ConvertDigit.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/dlog.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/dlog.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/dnn_score_api.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/dnn_score_api.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/decoder/feature/include/FeatureExtractor.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/FeatureExtractor.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/grammar/include/GrammarAPI.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/GrammarAPI.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/HttpRequest.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/HttpRequest.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/jsgf/include/jfstAPI.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/jfstAPI.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/mem_pool.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/mem_pool.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/pachira_encrypt_api.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/pachira_encrypt_api.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/pblas.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/pblas.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/PhoneTrie.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/PhoneTrie.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/SmartListen/include/SmartListen.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/SmartListen.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/stack.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/stack.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/StringBinaryHash.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/StringBinaryHash.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/StringHash.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/StringHash.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/include/Utility.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/Utility.h
ln -s /home/wangxin/programming/gitlab/HawkServer/src/vad/include/Vad.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/Vad.h
ln -s /home/wangxin/programming/gitlab/Wakeup/lib/include/wakeup.h \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/include/wakeup.h
ln -s /home/wangxin/programming/gitlab/HawkServer/build/base/libbase.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libbase.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/configure/libconfigure.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libconfigure.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/convert/libconvert.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libconvert.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/convertdigit/libconvertdigit.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libconvertdigit.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/decoder/feature/libfeature.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libfeature.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/grammar/libgrammar.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libgrammar.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/http/libhttp.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libhttp.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/jsgf/libjsgf.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libjsgf.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/mark/libmark.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libmark.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/decoder/score/libscore.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libscore.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/semanticjudge/libsemanticjudge.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libsemanticjudge.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/SmartListen/libSmartListen.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libSmartListen.a
ln -s /home/wangxin/programming/gitlab/HawkServer/build/vad/libvad.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libvad.a
ln -s /home/wangxin/programming/gitlab/Wakeup/build/core/libwakeup.a \
      /home/wangxin/programming/gitlab/TSPDecoder/AIBS/lib/x86-linux/libwakeup.a
