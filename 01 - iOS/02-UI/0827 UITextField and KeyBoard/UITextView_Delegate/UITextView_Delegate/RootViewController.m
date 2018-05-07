//
//  RootViewController.m
//  UITextView_Delegate
//
//  Created by 赵赤赤 on 15/8/27.
//  Copyright (c) 2015年 ;. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<UITextFieldDelegate>
    
@end

@implementation RootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITextField *textfield1 = [[UITextField alloc] initWithFrame:CGRectMake(60, 300, 200, 50)];
    textfield1.tag = 10;
    textfield1.borderStyle = UITextBorderStyleRoundedRect;
    textfield1.delegate = self;
    textfield1.clearButtonMode = UITextFieldViewModeAlways;
    
    UITextField *textfield2 = [[UITextField alloc] initWithFrame:CGRectMake(60, 500, 200, 50)];
    textfield2.tag = 20;
    textfield2.borderStyle = UITextBorderStyleRoundedRect;
    textfield2.delegate = self;
    textfield1.clearButtonMode = UITextFieldViewModeAlways;
    
    [self.view addSubview:textfield1];
    [self.view addSubview:textfield2];
}

// 即将开始编辑
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // 点击第二文本框的时候view上移
    if (textField.tag == 20) {
        [UIView beginAnimations:nil context:nil];
        CGRect frame = self.view.frame;
        frame.origin.y = -200;
        self.view.frame = frame;
        [UIView commitAnimations];
    }
    
    return YES;     // return NO，不允许开始编辑
}

// 已经开始编辑
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
}

// 即将结束编辑
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if (textField.tag == 20) {
        if (textField.text.length > 6) {
            return NO;
        }
    }
    return YES;    // 返回NO，无法结束编辑，比如点击return键不会结束编辑跳入下一输入框
}

// 已经结束编辑
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // 点击第二文本框的时候view下移回原来的位置
    if (textField.tag == 20) {
        [UIView beginAnimations:nil context:nil];
        CGRect frame = self.view.frame;
        frame.origin.y = 0;
        self.view.frame = frame;
        [UIView commitAnimations];
    }
}

// 新输入的字符即将拼接到text之后时，委托这个方法，控制输入的字符
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // 如果当前输入字符属于非法字符，不允许继续输入
    if ([string componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"~!@#$%^&*()"]].count>1) {
        return NO;
    }
    
    return YES;
}

// 清除按钮被点击
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    
    // 返回YES可以清除，返回NO不能清除
    return YES;
}

// return按钮被点击的情况
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 10) {
        UITextField *textfield2 = (id)[self.view viewWithTag:20];
        [textfield2 becomeFirstResponder];
    }
    else {
        [textField resignFirstResponder];
    }
    return YES;
}
@end
