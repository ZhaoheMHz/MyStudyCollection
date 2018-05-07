//
//  Car.m
//  Day7-ARC自动引用计数
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)dealloc
{
    NSLog(@"%@被销毁", _type);
}

- (void)run
{
}

- (NSString *)description
{
    return
    [NSString stringWithFormat:@"%@", _type];
}

@end
