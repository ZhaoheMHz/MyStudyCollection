//
//  Boss.m
//  Day4-04代理设计模式
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Boss.h"

@implementation Boss

- (void)work
{
    NSLog(@"开会...");
    NSLog(@"我想让人帮我买木头");
    
    [_delegate buyWood];
}

@end
