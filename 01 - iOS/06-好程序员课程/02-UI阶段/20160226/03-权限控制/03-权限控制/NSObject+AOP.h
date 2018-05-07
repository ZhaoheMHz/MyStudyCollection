//
//  NSObject+AOP.h
//  02-aop在视图编程中的应用
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AOP)

+(void)aop_changeMethod:(SEL)oldMethod newMethod:(SEL)newMethod;

@end
