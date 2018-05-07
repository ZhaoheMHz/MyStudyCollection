//
//  ViewController.m
//  07-核心动画03-图标抖动
//
//  Created by 赵赤赤 on 16/4/2.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    anim.keyPath = @"transform.rotation";
    
    anim.values = @[@(-(5.0/180*M_PI)), @((5.0/180*M_PI)), @(-(5.0/180*M_PI))];
    
    anim.repeatCount = MAXFLOAT;
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    [self.iconView.layer addAnimation:anim forKey:@"shake"];
    
    // 移除动画
//    [self.iconView.layer removeAnimationForKey:@"shake"];
}

@end
