//
//  Train.m
//  Day8-Block中的循环引用
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Train.h"

@implementation Train

- (void)dealloc
{
    NSLog(@"train被释放");
}

- (void)readyForRunningWithBlock:(void (^)())block
{
    NSLog(@"准备发车，请旅客抓紧时间上车");
    block();
}

- (void)startup
{
    NSLog(@"启动");
}

- (void)run
{
    NSLog(@"Run...");
    
    // 调用属性生成的block
    _block();
}

@end
