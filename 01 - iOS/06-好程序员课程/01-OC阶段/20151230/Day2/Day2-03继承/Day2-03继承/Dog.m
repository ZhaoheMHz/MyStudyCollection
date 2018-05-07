//
//  Dog.m
//  Day2-03继承
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "Dog.h"

//Autosynthesized property 'weight' will use  instance variable '_weight', not existing instance variable 'weight'
@implementation Dog

- (void)bark
{
    NSLog(@"%@: wang...", _type);
}

#pragma mark - 重写父类中声明的方法 -

// 多态：相同的方法，可以有不同的实现
- (void)eat
{
    NSLog(@"%@吃狗粮", _type);
}

- (void)move
{
    NSLog(@"%@奔跑", _type);
}

- (void)sleep
{
    NSLog(@"%@睡觉", _type);
}

@end






