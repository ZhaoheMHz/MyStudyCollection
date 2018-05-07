//
//  PinchViewController.m
//  GestureDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "PinchViewController.h"

@interface PinchViewController ()

@end

@implementation PinchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addPinckGesture];
}

- (void)addPinckGesture
{
    UIImageView *kitty = [self getHelloKitty];
    kitty.frame = [UIScreen mainScreen].bounds;
    
    // 创建一个捏合手势
    UIPinchGestureRecognizer *pinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(kittyPinched:)];
    
    // 给kitty添加手势
    [kitty addGestureRecognizer:pinch];
}

- (void)kittyPinched:(UIPinchGestureRecognizer *)pinch
{
    static CGFloat scale = 1;
    
    pinch.view.transform = CGAffineTransformMakeScale(scale*pinch.scale, scale*pinch.scale);
    
    if (pinch.state == UIGestureRecognizerStateEnded) {
        scale *= pinch.scale;
    }
    
}

@end
