//
//  main.m
//  Day9-05JSON
//
//  Created by ZhangChao on 16/1/12.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
// JSON数据特点
// 1.数据结构简单
// 2.冗余数据少，数据轻量
// 3.可读性差
// JSON 和 XML 数据结构，在本质上差别不大
// JSON数据最外层一般都是 {}，此外，还可以是 []

void jsonTest()
{
    // JSON字符串：字符串的内容是满足JSON数据结构的
    /*
     {
     "name": "肖喆",
     "marry": 0,
     "age": 20
     }
     */
    NSString *jsonString =
    @"{\"name\":\"肖喆\", \"marry\":0,\"age\":20}";
    
    // 解析JSON数据
    // JSON对象：能够转换成JSON数据的OC对象，说的是对象本身
    // JSON对象：字典，数组
    NSDictionary *k =
    @{@"name": @"肖喆",
      @"marry": @0,
      @"age": @20};
    
    BOOL ret =
    [NSJSONSerialization isValidJSONObject:jsonDict];
    if (ret) {
        NSLog(@"合法");
    }
    else {
        NSLog(@"不合法");
    }
    
    // 把一个合法的JSON对象转换成JSON数据
    NSData *data =
    [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:nil];
    NSLog(@"%@", data);
    
    // 字符串不能直接作为JSON的顶级类型出现
    //        NSError *error = nil;
    //        NSData *data1 =
    //        [NSJSONSerialization dataWithJSONObject:jsonString options:0 error:&error];
    //        NSLog(@"%@", error);
    
    // 把JSON字符串中的内容，转换成合法的JSON对象
    // JSON字符串-》JSON数据-》JSON对象
    NSString *jsonArray =
    @"[{\"name\":\"肖喆\", \"marry\":0,\"age\":20},{\"name\":\"乔丹\", \"marry\":1,\"age\":50}]";
    
    NSData *jsonData =
    [jsonArray dataUsingEncoding:NSUTF8StringEncoding];
    
    // 把JSON数据转换为JSON对象 （最常用）
    
    // NSJSONReadingMutableContainers
    // 返回的结果是一个可变的JSON对象
    
    // NSJSONReadingMutableLeaves
    // 返回的结果是一个JSON字符串
    NSArray *array =
    [NSJSONSerialization
     JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
    NSLog(@"%@", array);
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        User *user = [[User alloc] init];
//        user.name = @"小红";
        
        // KVC赋值
        // 1.可以对隐藏在.m文件中的属性完成赋值
        // 2.可以访问私有的成员变量
        
        // KVC赋值时，会先到类中去查找有没有同名的属性，如果有，直接完成赋值；如果没有，再查找有没有以下划线开头的成员变量，找到进行赋值，没找到，再看有没有同名的成员变量，没找到，程序崩溃
        [user setValue:@"小红" forKey:@"name"];
        NSLog(@"%@", user);
    }
    return 0;
}







