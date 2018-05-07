//
//  main.m
//  Day9-04数据库初步
//
//  Created by ZhangChao on 16/1/12.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
// 导入库
// 选择target---》build phases---》link binary---》点击+号---》搜索libsqlite

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        const char *filename =
        "/Users/chao/Desktop/iOS-BJ1507/OC阶段/Day9/data.db";
        sqlite3 *database = nil;
        sqlite3_open(filename, &database);
        
        // 1.数据库操作句柄 database
        // 2.sql语句
        // 3.sql语句执行后的回调函数
        // 4.void *, 在C语言中，可以指代任意类型的指针，相当于OC的id类型
        // 5.错误信息
        const char *sql =
        "create table if not exists User(id integer)";
        
        // 通过OC字符串构造Sql语句
        NSString *string =
        [NSString stringWithFormat:
         @"insert into User values ('%d')", 10];
        const char *sql1 = string.UTF8String;
        
        // 如果是对象指针，就要使用nil
        // 其他的 使用NULL
        sqlite3_exec(database, sql, NULL, NULL, NULL);
        
        // 数据库支持的OC类型: NSString，NSNumber，NSData
        // integer---> NSNumber
        // text---> NSString
        // blob---> NSData
        
        sqlite3_close(database);
    }
    return 0;
}





