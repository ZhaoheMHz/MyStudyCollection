//
//  Person.m
//  Day4-01自动补全属性
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

// 匿名类别 (隐藏我们属性和方法声明)
@interface Person ()

@property NSString *name;

// 一般可以放功能比较重要的方法声明
- (void)work;

@end

@implementation Person
{// 如果不想对象暴露属性，可以将其写在.m文件中
    NSString *_name;
//    NSString *age;
}

// @synthesize 自动补全属性
// @synthesize 写在类的实现部分
// 自动补全属性：
// 1.如果将属性重新和另外一个成员变量进行绑定，那么他就不会和对应的以下划线开头的成员变量进行关联了
// 2.如果没有手动添加 = 号右边的成员变量，系统会为我们自动生成
// 3.编译器默认使用的是 @synthesize name = _name;

// 4.如果我们手动实现了对应的 set 和 get 方法，系统就不会为我们生成相应的成员变量了
// 5.如果我们手动实现了 set 或 get 方法，系统就不会为我们提供相应的核心实现了
//@synthesize name = _name;

//面试： @synthesize 和 @dynamic 有什么区别?


+ (void)test
{
    // 点语法
    // 只要实现set 或 get方法中的任意一种，就可以使用点语法
    Person *person = [[Person alloc] init];
    person.name = @"xiaohong";
    NSLog(@"%@", person.name);
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (NSString *)name
{
    return _name;
}

@end








