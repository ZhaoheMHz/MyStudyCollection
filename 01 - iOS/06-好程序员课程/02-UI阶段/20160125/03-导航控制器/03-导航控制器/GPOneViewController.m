//
//  GPOneViewController.m
//  03-导航控制器
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPOneViewController.h"
#import "GPTwoViewController.h"

@interface GPOneViewController ()

@end

@implementation GPOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 200, 100, 50);
    btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:self action:@selector(btnTouch) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnTouch
{
    //显示GPTwoViewController默认视图内容
    //1.创建一个视图控制器对象
    GPTwoViewController * twoViewController = [[GPTwoViewController alloc] init];
    twoViewController.view.backgroundColor = [UIColor orangeColor];
    //2.把视图控制器对象,交给导航控制器管理
    //.交给那个导航控制器管理?
    [self.navigationController pushViewController:twoViewController animated:YES];
    
    NSLog(@"self.navigationController %p",self.navigationController);
    
    //当前控制器又那个导航控制器管理,那么就交给谁
    //.如何获得导航控制器对象呢?
    //.为什么能够获得导航控制器对象?
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
