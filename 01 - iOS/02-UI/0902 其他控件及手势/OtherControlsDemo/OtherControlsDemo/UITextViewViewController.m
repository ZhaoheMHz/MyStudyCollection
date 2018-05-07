//
//  UITextViewViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "UITextViewViewController.h"

@interface UITextViewViewController ()<UITextViewDelegate>

@end

@implementation UITextViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createMyControl
{
    // 创建UITextView
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(60, 100, 200, 200)];
    
    // 设置背景色
    textView.backgroundColor = [UIColor purpleColor];
    
    // 设置文字颜色
    textView.textColor = [UIColor whiteColor];
    
    // 设置字体
    textView.font = [UIFont systemFontOfSize:30];
    
    // 设置默认文字,没有placeHolder
    textView.text = @"么么哒";
    
    // 设置对齐方式
    textView.textAlignment = NSTextAlignmentCenter;
    
    // 设置键盘外观
    textView.keyboardAppearance = UIKeyboardAppearanceLight;
    
    // 设置键盘类型
    textView.keyboardType = UIKeyboardTypeNumberPad;
    
    // 设计可否滚动
    textView.scrollEnabled = YES;
    
    // 设置滚动能否超出边界
    textView.scrollsToTop = NO;
    
    // 设置二级键盘
//    textView.inputAccessoryView
    
    // 设置一级键盘
//    textView.inputView
    
    textView.delegate = self;
    
    [self.view addSubview:textView];
}

// 即将开始编辑,返回YES允许编辑,返回NO不允许编辑
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    return YES;
}

// 即将结束编辑,返回YES允许结束,返回NO不允许结束
- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    return YES;
}

// 已经开始编辑
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    
}

// 已经结束编辑
- (void)textViewDidEndEditing:(UITextView *)textView
{
    
}

// 新输入的文字即将拼接到text之后,如果返回YES,允许拼接,返回NO不允许拼接,可以用来控制输入
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    return YES;
}

// 文字发生改变调用
- (void)textViewDidChange:(UITextView *)textView
{
    
}
@end
