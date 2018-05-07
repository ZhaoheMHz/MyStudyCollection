//
//  ViewController.m
//  09-核心动画05-CAAnimationGroup
//
//  Created by 赵赤赤 on 16/4/2.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    // 1.旋转
    CABasicAnimation *rotation = [CABasicAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.toValue = @(M_PI);
    
    // 2.缩放
    CABasicAnimation *scale = [CABasicAnimation animation];
    scale.keyPath = @"transform.scale";
    scale.toValue = @(0.0);
    
    // 设置Group
    group.animations = @[rotation, scale];
    group.duration = 2.0;
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    
    [self.myView.layer addAnimation:group forKey:nil];
    
    
    
    
    
    
    // UIView封装的动画
//    [UIView transitionWithView:self.myView duration:1.0 options:<#(UIViewAnimationOptions)#> animations:<#^(void)animations#> completion:<#^(BOOL finished)completion#>]
}

@end
