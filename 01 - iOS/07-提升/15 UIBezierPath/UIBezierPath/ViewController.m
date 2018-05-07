//
//  ViewController.m
//  UIBezierPath
//
//  Created by 赵赤赤 on 16/3/18.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "BezierPathView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    BezierPathView *bezierView = [[BezierPathView alloc] initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:bezierView];
}

@end
