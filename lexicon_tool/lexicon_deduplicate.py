#!/usr/bin/python
#coding=utf-8


#从词典2里面找出词典1里面没有的行,并且将这些行生成一个新的词典

from sys import argv
import sys
import os

def readlexicon(fp, dict):
    lines = fp.readlines()
    for line in lines:
        line = line.strip()
        split_lint = line.split(';', 2)
        key = split_lint[0]
        dict_type = split_lint[1]
        value = split_lint[2]
        if len(dict) == 0:
            value_list = [value]
            dict[key] = value_list
        else:
            if key in dict.keys():
                value_list = dict[key]
                value_list.append(value)
                dict[key] = value_list
            else:
                value_list = [value]
                dict[key] = value_list

if __name__ == "__main__":
    if len(argv) != 3:
        print("Usage: lexicon1 lexicon2")
        sys.exit()

    dict1 = {}
    dict2 = {}

    lex1 = open(argv[1], 'r')
    lex2 = open(argv[2], 'r')
    lex3 = open('./lexicon_output.txt', 'w')
    print "start to read lex1"
    readlexicon(lex1, dict1)
    print "read lex1 done!"
    print "start to read lex2"
    readlexicon(lex2, dict2)
    print "read lex2 done!"
    # for key in dict1:
    #     print "=====dict1====="
    #     print "key:%s" % key
    #     print dict1[key]
    #     print "=====end====="
    # for key in dict2:
    #     print "=====dict2====="
    #     print "key:%s" % key
    #     print dict2[key]
    #     print "=====end====="
    for key in dict2.keys():
        if key in dict1.keys():
            dict1_value = dict1[key]
            dict2_value = dict2[key]
            for value in dict2_value:
                if value not in dict1_value:
                    buffer = "%s;2;%s\n" % (key, value)
                    lex3.write(buffer)
        else:
            for value in dict2[key]:
                buffer = "%s;2;%s\n" % (key, value)
                lex3.write(buffer)

                
    lex1.close()
    lex2.close()
    lex3.close()
