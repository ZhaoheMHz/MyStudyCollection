//
//  LongPressViewController.m
//  GestureDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "LongPressViewController.h"

@interface LongPressViewController ()

@end

@implementation LongPressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addLongPressGesture];
}

- (void)addLongPressGesture
{
    UIImageView *kitty = [self getHelloKitty];
    
    // 创建一个长按手势
    UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressed:)];
    
    // 设置触发的最小时间
    longPress.minimumPressDuration = 1;
    
    // 给kitty添加长按手势
    [kitty addGestureRecognizer:longPress];
}

- (void)longPressed:(UILongPressGestureRecognizer *)gesture
{
    NSLog(@"谁按谁帅哥");
}

@end
