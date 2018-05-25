//
//  ViewController.m
//  NSExceptionHandler
//
//  Created by 赵赫 on 2018/5/24.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) UIViewController *vc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @[][1];
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
