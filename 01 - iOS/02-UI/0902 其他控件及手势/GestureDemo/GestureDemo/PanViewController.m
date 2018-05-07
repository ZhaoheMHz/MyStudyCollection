//
//  PanViewController.m
//  GestureDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "PanViewController.h"

@interface PanViewController ()

@end

@implementation PanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addPanGesture];
}

- (void)addPanGesture
{
    UIImageView *kitty = [self getHelloKitty];
    
    // 拖拽
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panKitty:)];
    
    // 给kitty添加拖拽手势
    [kitty addGestureRecognizer:pan];
}

- (void)panKitty:(UIPanGestureRecognizer *)gesture
{
    // 通过手势获取拖拽偏移量
    CGPoint point = [gesture translationInView:self.view];
    
    static CGPoint center;
    
    if (gesture.state == UIGestureRecognizerStateBegan) {
        // 获取手势的视图,添加到哪个视图有,就获取哪个视图
        center = gesture.view.center;
    }
    gesture.view.center = CGPointMake(center.x+point.x, center.y+point.y);
}

@end
