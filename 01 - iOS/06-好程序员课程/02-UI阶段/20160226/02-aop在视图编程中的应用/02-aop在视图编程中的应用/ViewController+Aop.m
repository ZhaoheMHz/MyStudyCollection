//
//  ViewController+Aop.m
//  02-aop在视图编程中的应用
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController+Aop.h"
#import "NSObject+AOP.h"

@implementation ViewController (Aop)

+(void)load
{
    /*
    Method oldMethod =  class_getInstanceMethod([ViewController class], @selector(viewWillAppear:));
    Method newMethod = class_getInstanceMethod([ViewController class], @selector(aop_viewWillAppear:));
    
    method_exchangeImplementations(oldMethod, newMethod);
     */
    
    [self aop_changeMethod:@selector(viewWillAppear:) newMethod:@selector(aop_viewWillAppear:)];
    
}

- (void)aop_viewWillAppear:(BOOL)animated
{
    NSLog(@"加入统计代码");
    
    //
    [self aop_viewWillAppear:animated];
    
    NSLog(@"加入其他代码");
}

@end
