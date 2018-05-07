//
//  Mother.m
//  Day5-03Block
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Mother.h"

@implementation Mother

- (void)goOutsideWithAction:(void (^)())action
{
    NSLog(@"mother 要外出");
    action();
}

@end
