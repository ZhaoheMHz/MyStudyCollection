//
//  SwipeViewController.m
//  GestureDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "SwipeViewController.h"

@interface SwipeViewController ()

@end

@implementation SwipeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addSwipeGesture];
}

- (void)addSwipeGesture
{
    UIImageView *kitty = [self getHelloKitty];
    
    // 创建一个滑动手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeKitty:)];
    
    // 设置手势的监听方向
    swipe.direction = UISwipeGestureRecognizerDirectionRight | UISwipeGestureRecognizerDirectionLeft;
//    UISwipeGestureRecognizerDirectionRight
//    UISwipeGestureRecognizerDirectionLeft
//    UISwipeGestureRecognizerDirectionUp
//    UISwipeGestureRecognizerDirectionDown
    
    // 给kitty添加手势
    [kitty addGestureRecognizer:swipe];
}

- (void)swipeKitty:(UISwipeGestureRecognizer *)gesture
{
    if (gesture.direction &= UISwipeGestureRecognizerDirectionRight) {
        NSLog(@"向右");
    }
    if (gesture.direction &= UISwipeGestureRecognizerDirectionLeft) {
        NSLog(@"向左");
    }
}

@end
