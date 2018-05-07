//
//  RotationViewController.m
//  GestureDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "RotationViewController.h"

@interface RotationViewController ()

@end

@implementation RotationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addRotationGesture];
}

- (void)addRotationGesture
{
    UIImageView *kitty = [self getHelloKitty];
    
    kitty.frame = [UIScreen mainScreen].bounds;
    
    // 创建一个旋转手势
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(kittyRotation:)];
    
    // 给kitty添加旋转手势
    [kitty addGestureRecognizer:rotation];
}

- (void)kittyRotation:(UIRotationGestureRecognizer *)gesture
{
    static CGFloat rotation = 0;
    
    // 获取手势的旋转角度
    CGFloat rog = gesture.rotation;
    
    gesture.view.transform = CGAffineTransformMakeRotation(gesture.rotation+rotation);
    if (gesture.state == UIGestureRecognizerStateChanged) {
        rotation = rog+rotation;
    }
}

@end
