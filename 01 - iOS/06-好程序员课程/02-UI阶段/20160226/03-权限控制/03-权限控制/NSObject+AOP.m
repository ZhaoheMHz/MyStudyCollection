//
//  NSObject+AOP.m
//  02-aop在视图编程中的应用
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "NSObject+AOP.h"
#import <objc/runtime.h>

@implementation NSObject (AOP)


+(void)aop_changeMethod:(SEL)oldMethod newMethod:(SEL)newMethod
{
   Method tmpOld = class_getInstanceMethod([self class], oldMethod);
   Method tmpNew =  class_getInstanceMethod([self class], newMethod);
    method_exchangeImplementations(tmpOld, tmpNew);
}
@end
