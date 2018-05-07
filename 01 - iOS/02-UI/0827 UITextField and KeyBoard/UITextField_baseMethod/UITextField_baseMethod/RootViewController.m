//
//  RootViewController.m
//  UITextField_baseMethod
//
//  Created by 赵赤赤 on 15/8/27.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "RootViewController.h"
#import "KeyboardView.h"
@interface RootViewController ()<KeyboardViewDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // UITextField是UI中的文本输入视图
    
    [self createTextField];
    [self textSetting];
//    [self styleSetting];
    [self keyboardSetting];
}

/** 创建TextField */
- (void)createTextField
{
    // 创建TextField
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(60, 100, 200, 50)];
    
    // 设置边框
//    textField.borderStyle = UITextBorderStyleRoundedRect;
//    UITextBorderStyleNone         无边框；
//    UITextBorderStyleLine         线性矩形；
//    UITextBorderStyleBezel        尖角矩形；
//    UITextBorderStyleRoundedRect  圆角矩形
    
    textField.tag = 10;
    
    [self.view addSubview:textField];
}

/** 文字相关的属性和方法 */
- (void)textSetting
{
    UITextField *textFiled = (id)[self.view viewWithTag:10];
    
    // 设置显示文字
//    textFiled.text = @"我是文本输入框";
    
    // 设置对其方式
    textFiled.textAlignment = NSTextAlignmentLeft;
    
    // 设置字体
    textFiled.font = [UIFont boldSystemFontOfSize:40];
    
    // 自适应宽度
    textFiled.adjustsFontSizeToFitWidth = YES;
    
    // 设置最小文字的字号
    textFiled.minimumFontSize = 10;         // 设置自适应宽度后生效
    
    // 设置文字颜色
//    textFiled.textColor = [UIColor redColor];
    
    // 设置每一次开始编辑时清空上一次的文字
    textFiled.clearsOnBeginEditing = YES;
    
    // 设置提示文字
    textFiled.placeholder = @"请输入用户名";
    
    // 设置成为第一响应者，屏幕上可能有多个可编辑的视图，谁正在编辑，谁就是第一响应者
    [textFiled becomeFirstResponder];
}

/** 重写父类的方法，收起键盘 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 第一种：点击屏幕时放弃第一响应
//    UITextField *textFiled = (id)[self.view viewWithTag:10];
//    [textFiled resignFirstResponder];
    
    // 第二种：点击屏幕结束编辑
    [self.view endEditing:YES];
}

/** 设置样式 */
- (void)styleSetting
{
    UITextField *textFiled = (id)[self.view viewWithTag:10];
    
    // 设置背景颜色
//    textFiled.backgroundColor = [UIColor cyanColor];
    
    // 通过layer设置边框
//    textFiled.layer.borderWidth = 1;
//    textFiled.layer.borderColor = [UIColor greenColor].CGColor;
//    textFiled.layer.cornerRadius = 8;
    
    // 设置样式，见createTextFiled
    
    // 设置清除按钮
    textFiled.clearButtonMode = UITextFieldViewModeWhileEditing;
//    UITextFieldViewModeNever
//    UITextFieldViewModeWhileEditing
//    UITextFieldViewModeUnlessEditing
//    UITextFieldViewModeAlways
    
    // 设置图片
    UIImage *image = [UIImage imageNamed:@"1.png"];
    textFiled.bounds = CGRectMake(0, 0, image.size.width, image.size.height);
    textFiled.background = image;
    
    // 设置不可编辑时的图片
    textFiled.disabledBackground = [UIImage imageNamed:@"5.png"];
    
    // 设置禁用
//    textFiled.enabled = NO;
    
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    // 设置三原色，0～250，这里区间设为0～1
    leftView.backgroundColor = [UIColor colorWithRed:0.8 green:0.3 blue:0.1 alpha:1];
    
    UIView *rightView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    // 设置三原色，0～250，这里区间设为0～1
    rightView.backgroundColor = [UIColor colorWithRed:0.8 green:0.3 blue:0.1 alpha:1];
    
    // 为TextField设置左视图
    textFiled.leftView = leftView;
    // 设置左视图显示模式，默认是不显示的
    textFiled.leftViewMode = UITextFieldViewModeWhileEditing;
    
    // 为TextField设置右视图
    textFiled.rightView = rightView;
    textFiled.rightViewMode = UITextFieldViewModeWhileEditing;
}

/** 设置键盘 */
- (void)keyboardSetting
{
    UITextField *textFiled = (id)[self.view viewWithTag:10];
    
    // 设置密闻输入
//    textFiled.secureTextEntry = YES;
    
    // 设置大小写的控制方式
    textFiled.autocapitalizationType = UITextAutocapitalizationTypeAllCharacters;
//    UITextAutocapitalizationTypeNone              没有大小
//    UITextAutocapitalizationTypeWords             每一个单词的首字母大写
//    UITextAutocapitalizationTypeSentences         句子的第一个单词的首字母大写
//    UITextAutocapitalizationTypeAllCharacters     所有字符都大写
    
    // 设置键盘的外观
    textFiled.keyboardAppearance = UIKeyboardAppearanceDark;
//    UIKeyboardAppearanceDefault                               默认
//    UIKeyboardAppearanceDark NS_ENUM_AVAILABLE_IOS(7_0)       黑色
//    UIKeyboardAppearanceLight NS_ENUM_AVAILABLE_IOS(7_0)
//    UIKeyboardAppearanceAlert = UIKeyboardAppearanceDark
    
    // 设置键盘类型
    textFiled.keyboardType = UIKeyboardTypeDefault;
    
    // 设置return按钮
    textFiled.returnKeyType = UIReturnKeyDone;
    
    // 设置二级键盘
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    view.backgroundColor = [UIColor grayColor];
    textFiled.inputAccessoryView = view;
    
    // 修改键盘
    KeyboardView *keyboard = [[KeyboardView alloc] init];
    keyboard.delegate = self;
    textFiled.inputView = keyboard;
}

- (void)keyView:(KeyboardView *)KeyboardView enterS:(NSString *)string
{
    UITextField *textFiled = (id)[self.view viewWithTag:10];
    textFiled.text = [NSString stringWithFormat:@"%@%@", textFiled.text, string];
}

@end
