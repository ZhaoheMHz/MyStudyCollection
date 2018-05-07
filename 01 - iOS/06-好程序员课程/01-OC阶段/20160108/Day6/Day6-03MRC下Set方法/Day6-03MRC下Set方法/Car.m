//
//  Car.m
//  Day6-03MRC下Set方法
//
//  Created by ZhangChao on 16/1/8.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Car.h"

@implementation Car

- (void)dealloc
{
    NSLog(@"Car:%@被销毁", _type);
    [_type release];
    
    [super dealloc];
}

@end




