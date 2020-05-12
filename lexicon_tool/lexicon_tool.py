#!/usr/bin/python
#coding=utf-8
from sys import argv
import sys
import os
import time

if __name__ == "__main__":
    for arg in argv[1:]:
        if arg == '-l':
            break
        elif arg == '-h':
            print('Usage:%s -l [lexicon]' % argv[0])
            sys.exit()
        else:
            print ('Usage:%s -l [lexicon]' % argv[0])
            sys.exit()

    lexicon = sys.argv[2]
    print('lexicon:%s\n' % lexicon)

    lex_f = open(lexicon)
    lines = lex_f.readlines()
    new_lex = open("./new_lexicon", 'w')
    dict = {}

    for line in lines:
        #print (line)
        line = line.strip()
        split_line = line.split(';', 2)
        key = split_line[0]
        dic_type = split_line[1]
        value = split_line[2]
        #print('%s %s %s' % (key, dic_type, value))
        '''
        for s in key:
            if (u'\u0041'<= s <= u'\u005a') or (u'\u0061' <= s <= '\u007a'):
                write_flag = false
        '''
        if len(dict) == 0:
            value_list  = [value]
            dict[key] = value_list
        else:
            if key in dict.keys():
                value_list = dict[key]
                value_list.append(value)
                dict[key] = value_list
            else:
                value_list = [value]
                dict[key] = value_list


    lex_f.seek(0)
    lines = lex_f.readlines()
    for line in lines:
        write_flag = False
        line = line.strip()
        #print(line)
        split_line = line.split(';', 2)
        #print(split_line)
        key = split_line[0]
        dic_type = split_line[1]
        value = split_line[1]
        is_eng = False

        for s in key:
            if (u'\u0041'<= s <= u'\u005a') or (u'\u0061' <= s <= '\u007a'):#存在英文
                #print('eng word:%s' % split_line)
                write_flag = True
                is_eng = True
                break

        if not is_eng:
            if len(key) == 1:#单个中文字
                #print('单字:%s len:%d' % (key, len(key)))
                #time.sleep(1)
                write_flag = True
            else:
                value_list = dict[key]
                #print('key:%s value:%s' % (key, value_list))
                #time.sleep(1)
                if len(value_list) == 1:#词组不能有多音
                    for i in range(0, len(key)):
                        if key[i] in dict.keys():
                            v_list = dict[key[i]]
                            if (len(v_list) > 1):
                                if(len(key) <= 2):
                                    write_flag = True
                                else:
                                    is_exist = False
                                    j = 0
                                    while(j < i):
                                        if (key[j:i+1] == key) or (len(key[j:i+1]) == 1):
                                            j += 1
                                            continue
                                        if key[j:i+1] in dict.keys():
                                            is_exist = True
                                        j += 1

                                    x = 0
                                    while(x <= len(key)):
                                        if (key[i:x] == key) or (len(key[i:x]) == 1):
                                            x += 1
                                            continue
                                        if key[i:x] in dict.keys():
                                            is_exist = True
                                        x += 1
                                    
                                    if not is_exist:
                                        write_flag = True
                            else:
                                if (value_list[0].find(v_list[0]) == -1):
                                    write_flag = True
                        #else:
                        #   write_flag = True
        if write_flag:
            #print('write line: %s' % line)
            new_lex.write(line + '\n')
    lex_f.close()
    new_lex.close()
