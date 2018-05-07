//
//  BaseViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
#define VALUE arc4random()%256/255.0f
    self.view.backgroundColor = [UIColor colorWithRed:VALUE green:VALUE blue:VALUE alpha:1];
    
    [self createMyControl];
}

- (void)createMyControl
{
    
}



@end
