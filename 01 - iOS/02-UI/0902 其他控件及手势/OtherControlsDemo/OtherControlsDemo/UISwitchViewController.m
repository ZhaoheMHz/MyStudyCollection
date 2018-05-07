//
//  UISwitchViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "UISwitchViewController.h"

@interface UISwitchViewController ()

@end

@implementation UISwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createMyControl
{
    // UISwitch开关控件
    UISwitch *sw = [[UISwitch alloc] initWithFrame:CGRectMake(60, 200, 100, 50)];  // 大小失效,设置多少可以
    
    // 添加事件
    [sw addTarget:self action:@selector(switchONorOFF:) forControlEvents:UIControlEventValueChanged];
    
    // 设置出事初始状态
    [sw setOn:YES animated:YES];
    
    // 设置镂空颜色
    sw.tintColor = [UIColor magentaColor];
    
    // 设计打开时的图片
    [sw setOnImage:[UIImage imageNamed:@""]];
    
    // 设置关闭时的图片
    [sw setOffImage:[UIImage imageNamed:@""]];
    
    [self.view addSubview:sw];
    
}


- (void)switchONorOFF:(UISwitch *)sw
{
    NSLog(@"%@", sw.on?@"开关打开":@"开关关闭");
}
@end
