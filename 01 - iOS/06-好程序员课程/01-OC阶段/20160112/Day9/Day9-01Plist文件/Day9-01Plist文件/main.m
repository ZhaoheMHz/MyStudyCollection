//
//  main.m
//  Day9-01Plist文件
//
//  Created by ZhangChao on 16/1/12.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        NSArray *array = @[@"one", @"two", @"three"];
        
        // 写文件
        // Plist文件的后缀名是.plist
        // Plist 又叫属性列表
        // Plist文件的根节点，类型只能是数组或字典
        // Plist文件支持的数据类型: Array，Dictionary，Boolean，String，Data，Date，Number
        // Plist文件实际上就是XML格式的数据
        
        // atomically:YES 表示写文件时，先回把数据写到一个副本中，等数据全部写入后，在放到目标路径下
        [array writeToFile:@"/Users/chao/Desktop/iOS-BJ1507/OC阶段/Day9/test.plist" atomically:YES];
        
        NSDictionary *dict = @{@"name": @"xxx"};
        [dict writeToFile:nil atomically:YES];
        
        // 把一个可变字典存入Plist文件后，再取出来之后，这个对象是可变的还是不可变的?
        
        // 从Plist文件中取数据
        array =
        [NSArray arrayWithContentsOfFile:@"/Users/chao/Desktop/iOS-BJ1507/OC阶段/Day9/test.plist"];
        NSLog(@"%@", array);
        
        
        // 对字符串直接进行文件写入，只会把数据存入一个文本文件中
        NSString *string = @"hello";
        [string writeToFile:nil atomically:YES encoding:NSUTF8StringEncoding error:nil];
    }
    
    return 0;
}






