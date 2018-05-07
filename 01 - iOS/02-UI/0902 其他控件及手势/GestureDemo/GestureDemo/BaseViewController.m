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
    // 创建图片
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 150, 200, 200)];
    imageView.image = [UIImage imageNamed:@"10_16.jpg"];
    imageView.tag = 20;
    
    // 让图片能够接收用户事件
    imageView.userInteractionEnabled = YES;
    
    [self.view addSubview:imageView];
}

- (UIImageView *)getHelloKitty
{
    UIImageView *kitty = (id)[self.view viewWithTag:20];
    return kitty;
}

@end
