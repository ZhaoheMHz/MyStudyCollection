//
//  RootViewController.m
//  02-二级键盘作业
//
//  Created by 赵赤赤 on 15/8/27.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "RootViewController.h"
#import "SecondKeyboard.h"

@interface RootViewController ()<SecondKeyboardDelegate>

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat fieldW = 200;
    CGFloat fieldH = 50;
    CGFloat fieldX = (self.view.frame.size.width - fieldW) * 0.5;
    CGFloat fieldY = 300;
    
    UITextField *textfield = [[UITextField alloc] initWithFrame:CGRectMake(fieldX, fieldY, fieldW, fieldH)];
    textfield.borderStyle = UITextBorderStyleRoundedRect;
    textfield.tag = 10;
    [self.view addSubview:textfield];
    
    SecondKeyboard *sk = [[SecondKeyboard alloc] init];
    sk.delegate = self;
    textfield.inputAccessoryView = sk;
}

- (void)keyView:(SecondKeyboard *)secondKeyboard enterS:(NSString *)string
{
    UITextField *textfield = (id)[self.view viewWithTag:10];
    textfield.text = [NSString stringWithFormat:@"%@%@", textfield.text, string];
}

@end
