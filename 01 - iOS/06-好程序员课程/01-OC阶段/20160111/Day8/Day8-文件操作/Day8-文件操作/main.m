//
//  main.m
//  Day8-文件操作
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Test.h"

// 宏定义中的 \ 表示下面的一行代码是归属于上面的宏
// 带参宏： 宏定义的名称（参数）
// 程序执行后，会把使用宏定义的部分，替换成相应的代码
#define kPathAtDesktop(subpath) \
[NSString stringWithFormat:@"/Users/chao/Desktop/%@", subpath]

//void returnString(NSString **string)
//{
//    *string = @"xxx";
//}

void fileManager()
{
    // NSFileManager 文件管理类（常用）
    // NSFileHandle 文件操作句柄
    
    // 1.获取文件管理类的单例
    NSFileManager *fileManager =
    [NSFileManager defaultManager];
    
    // 2.创建目录
    // 第一个参数：目录的完整路径
    // 第二个参数：是否生成中间路径
    // 第三个参数：目录属性（通常传nil）
    // 第四个参数：创建目录出错的信息
    /*
     #define kPathAtDesktop(subpath) \
     [NSString stringWithFormat:@"/Users/chao/Desktop/%@", subpath]
     */
    NSError *error = nil;
    BOOL ret =
    [fileManager createDirectoryAtPath:kPathAtDesktop(@"test")withIntermediateDirectories:NO attributes:nil error:&error];
    
    //        NSError **error1 = &error;
    //        *error1 类型？
    //        error = nil;
    //        [xxxx error:&error];
    //
    //        - (BOOL)xxxx error:(NSError **)error1
    //        {
    //            *error1 = [[NSError alloc] init];
    //        }
    if (ret) {
        NSLog(@"目录创建成功");
    }
    else {
        NSLog(@"目录创建失败,reason:%@", error);
    }
    
    // 3.生成中间目录
    // /Users/chao/Desktop/test1/test2
    [fileManager createDirectoryAtPath:kPathAtDesktop(@"test1/test2") withIntermediateDirectories:YES attributes:nil error:nil];
    
    // 4.创建文件
    NSString *string = @"www.1000phone.com";
    NSData *data =[string dataUsingEncoding:NSUTF8StringEncoding];
    
    // 多次创建相同的文件时，会进行覆盖操作
    [fileManager createFileAtPath:kPathAtDesktop(@"test.txt") contents:data attributes:nil];
    
    // 5.路径遍历
    
    // 浅度遍历
    NSArray *contents = [fileManager contentsOfDirectoryAtPath:@"/Users/chao/Desktop" error:nil];
    NSLog(@"contents: %@", contents);
    
    // 深度遍历
    contents = [fileManager subpathsOfDirectoryAtPath:@"/Users/chao/Desktop" error:nil];
    NSLog(@"contents: %@", contents);
    
    // 6.移动操作
    // toPath 目标路径的完整路径
    [fileManager moveItemAtPath:@"/Users/chao/Desktop/test.txt" toPath:@"/Users/chao/Desktop/test/test.txt" error:nil];
    
    // 7.复制操作
    [fileManager copyItemAtPath:@"/Users/chao/Desktop/test/test.txt" toPath:@"/Users/chao/Desktop/test/test111.txt" error:nil];
    
    // 8.删除操作
    [fileManager removeItemAtPath:@"/Users/chao/Desktop/test/test111.txt" error:nil];
    
    // 9.查看属性
    // command + shift + G 前往文件夹
    NSDictionary *dict =
    [fileManager attributesOfItemAtPath:@"/Users/chao/Desktop/test/test.txt" error:nil];
    NSLog(@"%@", dict);
    
    // 10.查看文件是否存在
    if ([fileManager fileExistsAtPath:@"/Users/chao/Desktop/test/test.txt"]) {
        
        NSLog(@"存在");
    }
    else {
        NSLog(@"不存在");
    }
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 错误： "_OBJC_CLASS_$_Test", referenced from:
        // 先确定有没有添加该类的.m文件到编译源文件列表中
        Test *test = [[Test alloc] init];
        
        // 1.打开文件
        
        // 以只读方式打开
        NSFileHandle *fileHandle =
        [NSFileHandle fileHandleForReadingAtPath:
         @"/Users/chao/Desktop/test.txt"];
        
        NSLog(@"%@",
              [fileHandle readDataToEndOfFile]);
        // 关闭文件
        [fileHandle closeFile];
        
        // 以写入方式打开
        // 以写入方法打开文件，不能够通过fileHandle对象进行数据读取，程序崩溃
        fileHandle =
        [NSFileHandle fileHandleForWritingAtPath:
         @"/Users/chao/Desktop/test.txt"];
        
        [fileHandle closeFile];
        
        // 以更新方式打开 (可读可写)
        fileHandle =
        [NSFileHandle fileHandleForUpdatingAtPath:
         @"/Users/chao/Desktop/test.txt"];
        
        // 2.读取数据
        // 从光标所在位置开始读取数据，一直到文件结束
        NSData *fileData =
        [fileHandle readDataToEndOfFile];
        
        NSString *string =
        [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
        
        // This method invokes readDataOfLength: as part of its implementation.
        fileData =
        [fileHandle readDataToEndOfFile];
        string =
        [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
        
        // 3.移动光标位置
        [fileHandle seekToFileOffset:4];
        
        fileData =
        [fileHandle readDataToEndOfFile];
        
        string =
        [[NSString alloc] initWithData:fileData encoding:NSUTF8StringEncoding];
        NSLog(@"%@", string);
        
        // 4.写入数据
        // 文件数据的读写依据的都是光标位置
        [fileHandle writeData:fileData];
        
        // 如果插入数据的位置，后面已经存在数据，就会执行覆盖操作
        [fileHandle seekToFileOffset:0];
        [fileHandle writeData:nil];
        
        // 立即同步文件数据
        [fileHandle synchronizeFile];
        [fileHandle closeFile];
        
        // 清空文件内容
        NSFileManager *fileManager = [NSFileManager defaultManager];
        [fileManager createFileAtPath:@"/Users/chao/Desktop/test.txt" contents:nil attributes:nil];
    }
    
    return 0;
}








