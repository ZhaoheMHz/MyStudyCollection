//
//  Person.m
//  Day7-ARC自动引用计数
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"person被销毁");
    
    // ARC下，系统会自动去调用父类的dealloc，无需手动添加
//    [super dealloc];
    // NSArray __unsafe_unretain  ?
}

- (void)setName:(NSString *)name
{
    _name = [name copy];
}

@end
