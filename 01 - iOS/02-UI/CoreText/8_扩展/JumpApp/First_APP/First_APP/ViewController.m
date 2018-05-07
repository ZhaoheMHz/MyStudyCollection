//
//  ViewController.m
//  First_APP
//
//  Created by baoxu on 16/1/22.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

#define MAIN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end
/**
 *  iOS9需要将你要在外部调用的URL scheme列为白名单，才可以完成跳转
 需要在info.plist中设置 LSApplicationQueriesSchemes 类型为数组，下面添加所有你用到的scheme
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"First_APP";
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    //1.输入框，用来传参
    self.inputField = [[UITextField alloc]initWithFrame:CGRectMake(50, 50, MAIN_WIDTH-100, 50)];
    self.inputField.borderStyle = UITextBorderStyleRoundedRect;
    
    //2.跳转按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(50, 150, MAIN_WIDTH-100, 50);
    
    [btn addTarget:self action:@selector(jumpToSecondApp:) forControlEvents:UIControlEventTouchUpInside];
    
    [btn setTitle:@"Goto Second_APP" forState:UIControlStateNormal];
    
    //3.显示参数的label
    self.contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 250, MAIN_WIDTH-100, 100)];
    self.contentLabel.numberOfLines = 0;
    
    
    [self.view addSubview:self.inputField];
    [self.view addSubview:btn];
    [self.view addSubview:self.contentLabel];
    
}

- (void)jumpToSecondApp:(id)sender {
    
    NSString *str = self.inputField.text;
    NSString *secondPath = [NSString stringWithFormat:@"SecondAPP://%@",str];
    //SecondAPP 表示要跳到的APP  的 URL Schemes（程序名）
    //需要在 SecondAPP的info-->URL Types 下面配置URL Schemes为SecondAPP，不允许使用下划线
    //  “://”是固定写法，URL可用（类似 http://）
    //后面的str就是传给 下一个app的参数
    
    NSURL *secondUrl = [NSURL URLWithString:secondPath];
    
    //打开程序
    //openURL表示启动别的程序
    [[UIApplication sharedApplication]openURL:secondUrl];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
