//
//  RootViewController.m
//  UITextView_Delegate
//
//  Created by 赵赤赤 on 15/8/27.
//  Copyright (c) 2015年 ;. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()
    
@end

@implementation RootViewController

- (void)dealloc
{
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    [nc removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [nc removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    [nc removeObserver:self name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UITextField *textfield1 = [[UITextField alloc] initWithFrame:CGRectMake(60, 180, 200, 50)];
    textfield1.borderStyle = UITextBorderStyleBezel;
    
    UITextField *textfield2 = [[UITextField alloc] initWithFrame:CGRectMake(60, 250, 200, 50)];
    textfield2.borderStyle = UITextBorderStyleBezel;
    
    [self.view addSubview:textfield1];
    [self.view addSubview:textfield2];
    
    // 获取通知中心，也是单例
    NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
    
    // 让self监听键盘弹出的通知
    // Observer:接收通知的对象
    // selector:接收通知之后调用的方法
    // name:通知的名字，具有唯一性
    [nc addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];         // 键盘弹出
    [nc addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];         // 键盘移除
    [nc addObserver:self selector:@selector(textFieldTextChange:) name:UITextFieldTextDidChangeNotification object:nil];            // textfield文字发生改变
}

- (void)keyboardWillShow:(NSNotification *)notify
{
    [UIView animateWithDuration:1 animations:^{
        self.view.bounds = CGRectMake(0, 100, self.view.bounds.size.width, self.view.bounds.size.height);
    }];
}

- (void)keyboardWillHide:(NSNotification *)notify
{
    [UIView animateWithDuration:1 animations:^{
        self.view.bounds = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    }];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)textFieldTextChange:(NSNotification *)notify
{
    // 将notify中的textfield取出来
    UITextField *textfield = notify.object;
    NSLog(@"%@", textfield.text);
}
@end
