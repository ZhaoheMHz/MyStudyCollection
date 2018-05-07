//
//  SettingView.m
//  Day7-04内存管理下的代理设计模式
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "SettingView.h"

@implementation SettingView

- (void)dealloc
{
    NSLog(@"SettingView被销毁");
}

- (void)jumpToBlueView
{
    // 产生循环引用
    _blueView = [[BlueSettingView alloc] init];
//    _blueView.delegate = self;
    [_blueView addTarget:self action:nil];
}

- (void)showOn
{
    NSLog(@"蓝牙开");
}

- (void)showOff
{
    NSLog(@"蓝牙关");
}

@end
