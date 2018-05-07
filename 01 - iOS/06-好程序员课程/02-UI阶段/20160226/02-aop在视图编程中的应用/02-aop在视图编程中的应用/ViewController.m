//
//  ViewController.m
//  02-aop在视图编程中的应用
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
/*

 1.统计,页面展现次数的统计
 2.用户按钮点击次数的统计
 3.页面停留时间的统计
 
 
 
 */

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
}


//当控制器视图,即将展现出来的时候,立即调用
- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    [super viewWillAppear:animated];
    
    //1.统计代码写这里
    
}


@end
