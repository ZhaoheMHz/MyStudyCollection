//
//  main.m
//  Day3-01字符串的使用
//
//  Created by ZhangChao on 16/1/4.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StringTest.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 类方法：
        // 类方法（静态方法），程序运行之初，该方法就已经分配好内存空间，类方法是属于公共空间中的
        
        // 对象方法：
        // 对象方法在调用时才进行压栈处理
        [StringTest test];
        
        
    }
    
    return 0;
}











