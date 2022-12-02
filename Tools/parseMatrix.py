#矩阵文件处理工具，用于在一个矩阵(表格)文件中筛选列数据，每个数据均用table键隔开
#给定一个索引文件，每行一个索引，在原矩阵文件中的第一行匹配索引名字，将匹配到索引所对应的整一列提取出来，形成新的矩阵
#输出到文件中

import os
import sys
import getopt
import numpy as np

help_info = 'Usage: ./parseMatrix.py -i [inputfile] -k [indexfile] -o [outputfile] \n \
                    -i, --input   [inputfile] : source file, must be in matrix form, every data element split by a TAB \n \
                    -k, --output  [indexfile] : this file privde some keyword one keyword a line \n \
                    -o, --keyword [outputfile] : output file scrip will search inputfile by keyword, generate a new matrix data, write it to this outputfile \n'

def printUsage():
    print(help_info)

def get_row_num(filename):
    fp = open(filename)
    lines = fp.readlines()
    fp.close()
    return len(lines)

def get_column_num(filename):
    fp = open(filename)
    line = fp.readline()
    arr = line.split()
    return len(arr)

def addSrcFileToMat(filename, row, column):
    fp = open(filename)
    lines = fp.readlines()
    #mat = np.zeros((row, column))
    mat = []
    row_idx = 0
    for line in lines:
        line = line.strip()
        line = line.split()
        #print(line)
        #mat[row_idx,:] = line[:]
        mat.append(line)
        row_idx += 1
    fp.close()
    return mat

def extractData(filename, data):
    fp = open(filename)
    lines = fp.readlines()
    key_arr = []
    out_mat = []
    gene_list = []
    for gene_name in data:
        gene_list.append(gene_name[0])

    out_mat.append(gene_list)
    # print("gene_list : ")
    # print(out_mat[0][0])
    # print(out_mat[0][1])
    # print(out_mat[0][2])

    for line in lines:
        line = line.strip()
        key_arr.append(line)
        #out_row = 1
        data_column = 0
        #print("data len : %d" % len(data))
        for name in data[0]:
            if name == line :
                gene_data_list = []
                for i in range(len(data)):
                    #print('i:%d' %i)
                    #print('data_column : %d' % data_column)
                    gene_data_list.append(data[i][data_column])
                out_mat.append(gene_data_list)
                #out_row += 1
            data_column += 1
    fp.close()
    return out_mat


def genrateFile(matrix, output_file):
    fp = open(output_file, 'w')
    for i in range(len(matrix[0])): #column
        for j in range(len(matrix)): #row
            fp.write(matrix[j][i])
            if j != (len(matrix) - 1):
                fp.write('\t')
            else:
                fp.write('\n')
    fp.close()



if __name__ == '__main__':
    ifile = ''
    kfile = ''
    ofile = ''
    if len(sys.argv) < 2:
        printUsage()
        sys.exit(1)
    try:
        opts, args = getopt.getopt(sys.argv[1:], 'hi:o:k:',['input=','output=','keyword='])
    except getopt.GetoptError:
        printUsage();

    for opt, arg in opts:
        if opt == '-h':
            printUsage()
            sys.exit(1)
        elif opt in ('-i', '--input'):
            ifile = arg
        elif opt in ('-k', '--keyword'):
            kfile = arg
        elif opt in ('-o', '--output'):
            ofile = arg
        else:
            printUsage()
            sys.exit(1)



    src_file = ifile
    key_file = kfile
    #file = './test_matrix.txt'

    row_num = get_row_num(src_file)
    print('source matrix total row: %d' % row_num)

    column_num = get_column_num(src_file)
    print('source matrix total column: %d' % column_num)

    matrix = addSrcFileToMat(src_file, row_num, column_num)
    #print(matrix)
    # print(matrix[0][0])
    # print(matrix[0][1])
    # print(matrix[1][0])

    out_mat = extractData(key_file, matrix)

    # print('out_mat:')
    # print(out_mat[0][0])
    # print(out_mat[0][1])
    # print(out_mat[1][0])
    print('transfer matrix total row : %d' % len(out_mat))
    print('transfer matrix total column  %d' % len(out_mat[1]))

    print('begin to genrate file ...\n')
    genrateFile(out_mat, ofile)
    print('done ...\n')
    print('check your new file in : %s' % ofile)
