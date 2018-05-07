//
//  ViewController.m
//  03-CALayer03-隐式动画
//
//  Created by 赵赤赤 on 15/11/13.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layer = [[CALayer alloc] init];
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.position = CGPointMake(0, 0);
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    
    // 设置锚点
    self.layer.anchorPoint = CGPointMake(0, 0);
    [self.view.layer addSublayer:self.layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 隐式动画
    self.layer.backgroundColor = [UIColor blueColor].CGColor;
    self.layer.opacity = 0.5;
    self.layer.position = CGPointMake(300, 300);
}

@end
