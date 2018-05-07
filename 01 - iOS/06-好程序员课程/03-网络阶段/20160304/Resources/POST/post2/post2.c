//
//  post2.c
//  
//
//  Created by 潘松彪 on 14-9-11.
//
//

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>

#define PATH "/tmp/files/"

#define CONTENT_TYPE "CONTENT_TYPE"
#define CONTENT_LENGTH "CONTENT_LENGTH"
#define REQUEST_METHOD "REQUEST_METHOD"

int main(void)
{
    printf("Content-type: text/html;charset=utf-8\n\n");
    //启动程序时创建一个本地的存放文件的目录
    mkdir(PATH, 0777);
    
    //获取发送来的数据的大小
    int length = atoi(getenv(CONTENT_LENGTH));
    
    //根据大小创建堆空间
    char * p = (char *)malloc(length);
    //从标准输入中，将数据读取出来
    fread(p, length, 1, stdin);
    
    //将数据回馈给浏览器
    printf("%s", p);
    
    //C字符串操作
    //取出文件名
    char * ret = strstr(p, "filename=\"");
    ret += 10;
    char filename[100] = {};
    int i = 0;
    while (*ret != '\"') {
        filename[i++] = *ret;
        ret++;
    }
    
    printf("<p>%s</p>", filename);
    
    //C语言文件操作
    //创建新的文件
    char filePath[100] = {};
    strcat(filePath, PATH);
    strcat(filePath, filename);
    //filePath == "/tmp/files/xx.pdf"
    FILE * dstFile = fopen(filePath, "w");
    //以只写的方式打开文件，如果文件不存在，创建。
    
    //跳过报头
    ret = strstr(p, "\n");
    ret += 2;
    
    //写数据到dstFile当中
    fwrite(ret, length - (ret - p), 1, dstFile);
    
    //关闭文件
    fclose(dstFile);
    
    return 0;
}






