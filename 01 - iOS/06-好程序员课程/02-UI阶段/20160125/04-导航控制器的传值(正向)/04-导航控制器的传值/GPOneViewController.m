//
//  GPOneViewController.m
//  04-导航控制器的传值
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
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    /*
    //通过公开的属性,进行传值
    GPTwoViewController * twoViewController = [[GPTwoViewController alloc] init];
    twoViewController.nameText = @"黄继光";
    
    [self.navigationController pushViewController:twoViewController animated:YES];
     */
    
   /*
     //自定义一些常用的类方法
    GPTwoViewController * towViewController = [GPTwoViewController twoViewControllerWithNameTitle:@"刘少奇"];
    [self.navigationController pushViewController:towViewController animated:YES];
    */
    
    //ios 系统提供的一个全局的plist文件
    NSUserDefaults * udf = [NSUserDefaults standardUserDefaults];
    //存值
    [udf setObject:@"王二小" forKey:@"name"];
    
    //将值立即存储到文件中
    [udf synchronize];
    
    GPTwoViewController * twoViewcontroller =[[GPTwoViewController alloc] init];
    [self.navigationController pushViewController:twoViewcontroller animated:YES];
    
    
    
}

@end
