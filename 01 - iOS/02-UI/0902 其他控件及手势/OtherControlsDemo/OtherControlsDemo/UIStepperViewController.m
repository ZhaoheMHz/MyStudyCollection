//
//  UIStepperViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "UIStepperViewController.h"

@interface UIStepperViewController ()

@end

@implementation UIStepperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createMyControl
{
    UILabel *label  = [[UILabel alloc] initWithFrame:CGRectMake(60, 270, 200, 50)];
    label.backgroundColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:40];
    label.adjustsFontSizeToFitWidth = YES;
    label.tag = 10;
    [self.view addSubview:label];
    
    // UIStepper
    UIStepper *stepper = [[UIStepper alloc] initWithFrame:CGRectMake(60, 200, 200, 50)];
    
    // 设置最大值
    stepper.maximumValue = 100;
    
    // 设置最小值
    stepper.minimumValue = 0;
    
    // 设置间隔值,默认是1
    stepper.stepValue = 2;
    
    // 设置当前值
    stepper.value = 50;
    
    // 设置点中时自动增加
    stepper.autorepeat = YES;
    
    // 连续增加,autorepeat设置为YES才有效
    stepper.continuous = YES;
    
    // 设置背景图片
    [stepper setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    // 设置加号或减号的图片
    [stepper setIncrementImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [stepper setDecrementImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    // 设置镂空颜色
    [stepper setTintColor:[UIColor redColor]];
    
    // 添加事件
    [stepper addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:stepper];
}

- (void)valueChanged:(UIStepper *)stepper
{
    UILabel *label = (id)[self.view viewWithTag:10];
    NSString *text = [NSString stringWithFormat:@"%.1f", stepper.value];
    label.text = text;
}

@end
