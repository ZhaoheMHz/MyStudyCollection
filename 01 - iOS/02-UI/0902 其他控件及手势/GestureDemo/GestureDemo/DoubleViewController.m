//
//  DoubleViewController.m
//  GestureDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "DoubleViewController.h"

@interface DoubleViewController ()<UIGestureRecognizerDelegate>

@end

@implementation DoubleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addDoubleGesture];
}

- (void)addDoubleGesture
{
    UIImageView *kitty = [self getHelloKitty];
    kitty.frame = [UIScreen mainScreen].bounds;
    
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(kittyPinched:)];
    pinch.delegate = self;
    [kitty addGestureRecognizer:pinch];
    
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(kittyRotation:)];
    rotation.delegate = self;
    [kitty addGestureRecognizer:rotation];
}

- (void)kittyPinched:(UIPinchGestureRecognizer *)pinch
{
    static CGFloat scale = 1;
    
    pinch.view.transform = CGAffineTransformMakeScale(scale*pinch.scale, scale*pinch.scale);
    
    if (pinch.state == UIGestureRecognizerStateEnded) {
        scale *= pinch.scale;
        
        // 重置
        pinch.scale = 1;
    }
}

- (void)kittyRotation:(UIRotationGestureRecognizer *)gesture
{
    static CGFloat rotation = 0;
    
    // 获取手势的旋转角度
    CGFloat rog = gesture.rotation;
    
    gesture.view.transform = CGAffineTransformMakeRotation(gesture.rotation+rotation);
    if (gesture.state == UIGestureRecognizerStateChanged) {
        rotation = rog+rotation;
        
        // 重置
        [gesture setRotation:0];
    }
}

// 手势的代理方法,支持两个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer
{
    return YES;
}

@end
