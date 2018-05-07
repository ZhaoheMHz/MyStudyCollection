//
//  UIProgressViewViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "UIProgressViewViewController.h"

@interface UIProgressViewViewController ()
{
    NSTimer *_timer;
}
@end

@implementation UIProgressViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createMyControl
{
    // UIProgressView进度条
    UIProgressView *pv = [[UIProgressView alloc] init];
    pv.frame = CGRectMake(20, 250, 300, 20);
    pv.tag = 10;
    
    // 设置当前的进度
    pv.progress = 0;

    pv.transform = CGAffineTransformMakeScale(1, 5);
    
    // 设置镂空颜色
    pv.tintColor = [UIColor redColor];

    [self.view addSubview:pv];
    
    [self startTimer];
}

- (void)startTimer
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.002 target:self selector:@selector(valueChanged) userInfo:nil repeats:YES];
}

- (void)valueChanged
{
    UIProgressView *pv = (id)[self.view viewWithTag:10];
    if (pv.progress < 1) {
        [UIView animateWithDuration:0.002 animations:^{
            pv.progress += 0.0001;
        }];
    }
    else {
        [_timer setFireDate:[NSDate distantFuture]];
    }
}

@end
