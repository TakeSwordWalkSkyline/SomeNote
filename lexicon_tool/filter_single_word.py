from sys import argv
import sys
import os
import time
import pdb

#将词典2中存在但词典1中不存在的单字过滤出来

if __name__ == "__main__":
    if (len(argv) != 3):
        print('Usage:%s [lexicon1] [lexicon2]' % argv[0])
        sys.exit()
    #pdb.set_trace()
    lexicon1 = open(argv[1], 'r') #我们的词典
    lexicon2 = open(argv[2], 'r') #国标一二级
    lexicon_output = "filter_result.txt"
    lexicon_output_fp = open(lexicon_output, 'w')

    lines = lexicon1.readlines()
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

    lines2 = lexicon2.readlines()
    for line in lines2:
        line = line.strip()
        split_line = line.split(';',2)
        key = split_line[0]
        dict_type = split_line[1]
        value = split_line[2]
        if (int(dict_type) != 1):
            continue
        if (u'\u0041'<= key <= u'\u005a') or (u'\u0061' <= key <= '\u007a'):#存在英文
            continue
        else:
            if len(key) == 1:
                if key not in dict_1.keys():
                    buffer = "%s\n" % key
                    lexicon_output_fp.write(buffer)
            else:
                continue

    lexicon1.close()
    lexicon2.close()
    lexicon_output_fp.close()

    print("output:filter_result.txt")
