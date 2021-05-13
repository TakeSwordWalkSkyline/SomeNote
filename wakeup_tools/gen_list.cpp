#include "stdio.h"
#include "stdlib.h"
#include "unistd.h"
#include "string.h"
//find /data1/yanyan/./2mic61cm/processed/zh-CN-61cm-9-I-85/wakeup/wakeup-ft -name "*wav" > wakeup-ft.list
int main(int argc, char *argv[]) {
    if (argc < 4) {
        printf("Usage: %s dir_list gen_list audio_type[wav, pcm]\n", argv[0]);
        return -1;
    }
    FILE *fp = fopen(argv[1], "r");
    if (fp == NULL) {
        printf("open file failed!\n");
        return -1;
    }
    char line[512]= {0};
    char command[1024] = {0};
    while(fgets(line, 512, fp) != NULL) {
        if (line[0] == '#') {
            continue;
        }
        char* real_line = strtok(line, "\n");
        snprintf(command, 1024, "find %s -name \"*%s\" >> %s", real_line, argv[3], argv[2]);
        printf("%s\n", command);
        system(command);
        memset(command, 0, sizeof(command));
    }
}
