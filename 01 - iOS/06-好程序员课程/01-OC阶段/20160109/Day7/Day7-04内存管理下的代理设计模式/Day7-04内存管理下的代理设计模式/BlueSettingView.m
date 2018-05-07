//
//  BlueSettingView.m
//  Day7-04内存管理下的代理设计模式
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "BlueSettingView.h"

@implementation BlueSettingView

- (void)dealloc
{
    NSLog(@"BlueSettingView被销毁");
}

- (void)addTarget:(id)target action:(SEL)action
{
    // _target 使用weak
    // _actiom 使用assign
    _target = target;
    _action = action;
}

- (void)addTarget:(id)target
{
    _target = target;
}

- (void)turnOn
{
    if ([_delegate respondsToSelector:@selector(showOn)]) {
        
        [_delegate showOn];
        return;
    }
    
    // 错误的写法
//    if ([_target respondsToSelector:@selector(showOn)]) {
//        [_target performSelector:@selector(showOn)];
//        return;
//    }
    
    if ([_target respondsToSelector:_action]) {
        [_target performSelector:_action];
        return;
    }
}

- (void)turnOff
{
    if ([_delegate respondsToSelector:@selector(showOff)]) {
        [_delegate showOff];
        return;
    }
    
    if ( [_target respondsToSelector:@selector(showOff)]) {
        [_target performSelector:@selector(showOff)];
        return;
    }
}

@end
