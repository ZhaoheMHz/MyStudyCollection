//
//  ViewController.m
//  重力感应
//
//  Created by 赵赤赤 on 15/11/6.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"摇动开始");
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
    NSLog(@"摇动结束");
}

@end
