#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#define CONTENT_TYPE "CONTENT_TYPE"
#define CONTENT_LENGTH "CONTENT_LENGTH"
#define REQUEST_METHOD "REQUEST_METHOD"

int main(void)
{
	printf("Content-type: text/html;charset=utf-8\n\n");
	//获取请求的编码格式
	char * contentType = getenv(CONTENT_TYPE);
	//获取请求的参数列表的字节长
	int contentlength = atoi(getenv(CONTENT_LENGTH));
	//获取请求的种类
	char * contentMethod = getenv(REQUEST_METHOD);
		
	printf("<p>contentType:%s</p>", contentType);
	printf("<p>contentLength:%d</p>", contentlength);
	printf("<p>contentMethod:%s</p>", contentMethod);

	//开辟对应堆空间
	char * p = (char *)malloc(contentlength + 1);

	//post请求对于CGI是标准输入，可以通过scanf读出来
	scanf("%s", p);
	//读入请求的参数列表，存储到p中
	
	printf("%s", p);
	
	return 0;
}





