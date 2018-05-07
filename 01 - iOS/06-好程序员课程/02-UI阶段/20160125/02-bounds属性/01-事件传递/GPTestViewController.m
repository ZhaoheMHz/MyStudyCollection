//
//  GPTestViewController.m
//  01-事件传递
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTestViewController.h"
#import "GPGreenView.h"

@interface GPTestViewController ()

@end

@implementation GPTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];

    GPGreenView * greenView = [[GPGreenView alloc] init];
    [self.view addSubview:greenView];
    greenView.frame = CGRectMake(100, 100, 300, 400);
    greenView.backgroundColor = [UIColor greenColor];
    
    
    GPGreenView * redView = [[GPGreenView alloc] init];
    [greenView addSubview:redView];
    redView.frame = CGRectMake(100, 50, 150, 200);
    redView.backgroundColor = [UIColor redColor];
    
    
    GPGreenView * grayView = [[GPGreenView alloc] init];
    [greenView addSubview:grayView];
    grayView.frame = CGRectMake(100, 300, 50, 50);
    grayView.backgroundColor = [UIColor grayColor];
    

    
}



@end
