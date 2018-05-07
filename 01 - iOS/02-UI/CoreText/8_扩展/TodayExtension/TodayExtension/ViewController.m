//
//  ViewController.m
//  TodayExtension
//
//  Created by baoxu on 16/1/22.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
/**
 *  1.添加今天扩展
 Xcode导航栏 File--> New--> Target-->选择TodayExtension-->点击next，取个名字，下一步就创建好了
 
 2.认识Today扩展插件
 是自己带有一个视图，可以自定义自己喜欢的页面，注意：所有的扩展都是一个UIViewController，所以可以使用UIViewController里面的所有生命周期方法
 
 3.today上一般数据来自于服务器
 
 4.Today扩展插件，和本身工程是完全分离的，他们都有自己的工作目录，所以，要进行插件交互，需要后台数据和跳转设置
 
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, self.view.bounds.size.width-20, 30)];
    label.text = @"hello world";
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
