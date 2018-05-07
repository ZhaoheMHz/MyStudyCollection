//
//  Person.m
//  Day7-03循环引用
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
//    [_car release];
    NSLog(@"person 被销毁");
//    [super dealloc];
}


@end



