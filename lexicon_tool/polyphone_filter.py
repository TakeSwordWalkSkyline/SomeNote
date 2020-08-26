#!/usr/bin/python
#coding=utf-8
from sys import argv
import sys
import os
import time

#将词典中所有的多音单字全部过滤出来

if __name__ == "__main__":
    if (len(argv) != 2):
        print('Usage:%s [lexicon]' % argv[0])
        sys.exit()

    lexicon = sys.argv[1]
    print ('lexicon:%s\n' % lexicon)

    lex = open(lexicon, 'r')
    new_lex = open('./single_polyphone_word.txt', 'w')
    lines = lex.readlines()
    dict_1 = {}
    for line in lines:
        line = line.strip()
        split_line = line.split(';', 2)
        key = split_line[0]
        dict_type = split_line[1]
        value = split_line[2]
        if (int(dict_type) != 1):
            continue
        if (u'\u0041'<= key <= u'\u005a') or (u'\u0061' <= key <= '\u007a'):#存在英文
            continue
        else:
            if len(key) == 1:
                if key in dict_1.keys():
                    value_list = dict_1[key]
                    value_list.append(value)
                    dict_1[key] = value_list
                else:
                    value_list = [value]
                    dict_1[key] = value_list
                    
    for key in dict_1.keys():
        value_list = dict_1[key]
        if len(value_list) > 1:
            for v in value_list:
                buffer = "%s;1;%s\n" % (key, v)
                new_lex.write(buffer)
    print ('output:./single_polyphone_word.txt\n')
    lex.close()
    new_lex.close()
