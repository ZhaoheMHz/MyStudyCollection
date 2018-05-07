//
//  UIAlertViewViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "UIAlertViewViewController.h"

@interface UIAlertViewViewController ()<UIAlertViewDelegate>

@end

@implementation UIAlertViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createMyControl
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(60, 200, 200, 50)];
    [button setTitle:@"弹出警告" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(showAlert:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}

- (void)showAlert:(UIButton *)button
{
    // UIAlertView 警告视图
    // 标题:警告的关键信息
    // 消息:警告的描述信息
    // 代理对象
    // 取消按钮的标题
    // 其他按钮的标题
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"你妈飞了" message:@"您决定?" delegate:self cancelButtonTitle:@"坟头蹦迪" otherButtonTitles:@"灵车漂移", @"么么哒", nil];
    
    alert.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
//    UIAlertViewStyleDefault = 0,      默认
//    UIAlertViewStyleSecureTextInput,  带密文输入框的
//    UIAlertViewStylePlainTextInput,   带一个明文的输入框
//    UIAlertViewStyleLoginAndPasswordInput 带一个明文.密文的
    
    // 让警告弹出
    [alert show];
}


// 点击某一按钮是调用这个方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"坟头蹦迪");
            break;
        case 1:
            NSLog(@"灵车漂移");
            break;
        case 2:
            NSLog(@"么么哒");
            break;
        default:
            break;
    }
}

// 取消显示,来电打断或home键
- (void)alertViewCancel:(UIAlertView *)alertView
{
    
}

// 显示之前调用
- (void)willPresentAlertView:(UIAlertView *)alertView
{
    
}

// 已经显示
- (void)didPresentAlertView:(UIAlertView *)alertView
{
    
}

// 点击某一按钮,alertView将要消失的时候
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

// 点击某一按钮,alertView已经消失的时候
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

// 控制输入框下的第一个other按钮的状态,反悔YES可以点击,返回NO不可点击
- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
    UITextField *tf1 = [alertView textFieldAtIndex:1];
    if (tf1.text.length <6) {
        return NO;
    }
    return YES;
}


@end
