//
//  NSString+Helper.m
//  Day3-01字符串的使用
//
//  Created by ZhangChao on 16/1/4.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "NSString+Helper.h"

@implementation NSString (Helper)

// 翻转字符串
// 01234    43210
// 123456   654321
- (NSString *)reverse
{
    // 1. 获取字符串长度
    NSUInteger length = self.length;
    
    // calloc(length, bytes)
    // 1.第一个参数是指分配多少块内存
    // 2.第二个参数是指每块内存所占的字节数
    // 10, unichar --> 10 * 2
    
    // 2.分配一个缓冲区，用来进行字符翻转
    unichar *buffer = calloc(length, sizeof(unichar));
    
    // 3.把self中存的字符串常量放入buffer
    [self getCharacters:buffer range:NSMakeRange(0, length)];
    
    // 4.进行字符翻转
    // buffer[]
    for (int i = 0; i < length / 2; i++) {
        unichar temp = buffer[i];
        buffer[i] = buffer[length - 1 - i];
        buffer[length - 1 - i] = temp;
    }
    
    NSString *result =
    [NSString stringWithCharacters:buffer
                            length:length];
    
    free(buffer); // 动态内存空间使用之后要进行释放
    return result;
}

+ (NSString *)reverseString:(NSString *)aString
{
    return [aString reverse];
}



@end
