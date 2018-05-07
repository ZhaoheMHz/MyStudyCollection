//
//  ShakeViewController.m
//  GestureDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ShakeViewController.h"
#import "UIView+ShackAnimation.h"

@interface ShakeViewController ()

@end

@implementation ShakeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addShakeAnimation];
}

- (void)addShakeAnimation
{
    UIImageView *kitty = [self getHelloKitty];
    [kitty shakeWithRaid:3 duration:0.05 repeatCount:0];
}

@end
