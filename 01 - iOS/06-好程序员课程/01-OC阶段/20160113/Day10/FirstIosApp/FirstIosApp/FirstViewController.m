//
//  FirstViewController.m
//  FirstIosApp
//
//  Created by ZhangChao on 16/1/13.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label =
    [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 100, 30)];
    
    label.text = @"hello world";
    label.font = [UIFont systemFontOfSize:30];
    
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
