//
//  TapViewController.m
//  GestureDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "TapViewController.h"

@interface TapViewController ()

@end

@implementation TapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addTapGesture];
}

- (void)addTapGesture
{
    UIImageView *kitty = [self getHelloKitty];
    
    // 创建一个点击手势
    // 第一个参数:接收手势触发的对象
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(kittyTapped:)];
    
    // 设置要求点击的次数
    tap.numberOfTapsRequired = 2;
    
    // 设置点击的手指个数
    tap.numberOfTouchesRequired = 1;
    
    // 给kitty添加点击手势
    [kitty addGestureRecognizer:tap];
}

- (void)kittyTapped:(UITapGestureRecognizer *)gesture
{
    NSLog(@"kitty被点击");
}

@end
