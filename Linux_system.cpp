/***
system返回值：指调用system函数后的返回值
shell返回值：指system所调用的shell命令的返回值
system对于返回值的处理分三个阶段：
1.fork子进程等准备工作。如果失败return -1
2.调用bin/sh拉起shell脚本，如果拉起失败或者未正常结束，失败原因值会被写入status的低8-15位中
3.shell正常执行结束，将shell的返回值写入status的低8-15位中
***/
#include <stdio.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <sys/types.h>
 
int main() {
    pid_t status;
 
 
    status = system("./test.sh");
 
    if (-1 == status) {//fork子进程失败return -1

        printf("system error!");

    } else {
        printf("exit status value = [0x%x]\n", status);
 
        if (WIFEXITED(status)) {//这个宏用于指出子进程是否正常退出，正常退出则返回非0

            if (0 == WEXITSTATUS(status)) {//在WIFEXITED返回0的情况下用于接收子进程返回值的宏

                printf("run shell script successfully.\n");

            } else {

                printf("run shell script fail, script exit code: %d\n", WEXITSTATUS(status));
            }

        } else {

            printf("exit status = [%d]\n", WEXITSTATUS(status));

        }
    }
 
    return 0;
}
