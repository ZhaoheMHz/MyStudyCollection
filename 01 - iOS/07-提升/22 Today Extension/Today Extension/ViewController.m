//
//  ViewController.m
//  Today Extension
//
//  Created by 赵赤赤 on 2016/9/21.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建一个UserDefault
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.MyTodayGroup"];
    
    // 存储一个颜色
    [userDefaults setObject:@"redColor" forKey:@"color"];
    
    // 同步
    [userDefaults synchronize];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
