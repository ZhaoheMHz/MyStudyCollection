//
//  NSArray+AOP.m
//  01-aop基本语法实现
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "NSArray+AOP.h"

#import <objc/runtime.h>

@implementation NSArray (AOP)
//load方法,系统自动调用,并且在所有方法执行之前
//只会调用一次
//一些一次性配置的功能,可以在load方法中去编写
+(void)load
{
    NSLog(@"load");
    
    Method oldMethod =  class_getInstanceMethod([NSArray class], @selector(lastObject));
    Method newMethod = class_getInstanceMethod([NSArray class], @selector(my_lastObject));
    method_exchangeImplementations(oldMethod, newMethod);
    
}

- (id)my_lastObject
{

    /*
    NSString * value = [NSString stringWithFormat:@"最后一个元素是 %@", [self lastObject]];
     */
    
    NSString * value = [NSString stringWithFormat:@"最后一个元素是 %@", [self my_lastObject]];
    
    return value;
}

@end
