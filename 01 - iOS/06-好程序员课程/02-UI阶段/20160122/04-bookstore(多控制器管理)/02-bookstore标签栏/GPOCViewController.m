//
//  GPOCViewController.m
//  02-bookstore标签栏
//
//  Created by 哲 肖 on 16/1/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPOCViewController.h"

@interface GPOCViewController ()

@end

@implementation GPOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 200, 200, 50);
    btn.backgroundColor = [UIColor grayColor];
    
    [btn addTarget:self action:@selector(btnTouch) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnTouch
{
    NSLog(@"点击了按钮");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"%@ dealloc",NSStringFromClass([self class]));
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
