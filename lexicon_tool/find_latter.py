#!/usr/bin/python
#coding=utf-8

#找出词典中所有带英文的行

from sys import argv
import sys
import os
import re

if __name__ == "__main__":
    if len(sys.argv) != 2:
        print ("Usage: lexicon")
        sys.exit()

    lex = open(argv[1], 'r')
    output = open("./eng_key.txt", 'w')
    lines = lex.readlines()
    for line in lines:
        split_line = line.split(';', 2)
        key = split_line[0]
        value = split_line[2]
        is_eng = re.search('[a-zA-Z]', key)
        if is_eng:
            buffer = "%s;2;%s" % (key, value)
            output.write(buffer)
        else:
            pass
