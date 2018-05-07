//
//  Animal.m
//  Day2-03继承
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (instancetype)initWithType:(NSString *)type age:(NSUInteger)age sex:(NSString *)sex
{// init方法的实现模板
    
    // 1.self指针 在对象方法中代表类的当前对象
    // 2.super编译器符号，去调用父类的方法，当使用super时，编译器会按照自上往下的方式进行方法的查找
    self = [super init];
    
    if (self) { // 增强代码的健壮性
        _age = age;
        _sex = sex;
        _type = type;
    }
 
    // 返回初始化后的对象
    return self;
    
    // 构造方法：
    // 1.调用父类的初始化方法，完成隐藏属性和其他数据的初始化过程
    // 2.初始化该类中的属性
    // 3.返回初始化后的对象
}

- (void)eat
{
    NSLog(@"吃饭");
}

- (void)sleep
{
}

- (void)move
{
}

@end
