#!/usr/bin/python
#coding=utf-8

#将词典中的第一列(简体)转换为繁体
#词典格式word \t phones
#输入资源:繁简对应表

from sys import argv
import sys
import os

if __name__ == "__main__":
    if len(argv) != 3:
        print("Usage: lexicon STCharacters")
        sys.exit()

    lex_input = open(argv[1], 'r')
    lex_res = open(argv[2], 'r')
    lex_output = open("./output_lexicon.txt", 'w')
    res_dict = {}
    lines = lex_res.readlines()
    for line in lines:
        line = line.strip()
        split_line = line.split('\t', 1)
        key = split_line[0]
        value = split_line[1]
        if len(res_dict) == 0:
            res_dict[key] = value
        else:
            if key not in res_dict.keys():
                res_dict[key] = value
    lines = lex_input.readlines()
    for line in lines:
        line = line.strip()
        split_line = line.split('\t', 1)
        key = split_line[0]
        value = split_line[1]
        traditional_chinese = res_dict[key]
        array = traditional_chinese.split(' ', -1)
        for a in array:
            buffer = "%s;1;%s\n" % (a, value)
            lex_output.write(buffer)

    lex_input.close()
    lex_output.close()
    lex_res.close()
