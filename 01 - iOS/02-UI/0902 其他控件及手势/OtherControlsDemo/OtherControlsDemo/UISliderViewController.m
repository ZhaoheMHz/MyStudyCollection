//
//  UISliderViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "UISliderViewController.h"

@interface UISliderViewController ()

@end

@implementation UISliderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createMyControl
{
    CGSize size = [UIScreen mainScreen].bounds.size;
    
    // UISlider滑块视图
    UISlider *sliderRed = [[UISlider alloc] initWithFrame:CGRectMake(40, 100, size.width-80, 50)];
    sliderRed.tag = 10;
    
    // 设置最小值
    sliderRed.minimumValue = 0;
    
    // 设置最大值
    sliderRed.maximumValue = 255.0f;
    
    // 设置当前值
    sliderRed.value = 0;
    
    // 设置镂空颜色
    sliderRed.tintColor = [UIColor redColor];
    
    // 添加事件
    [sliderRed addTarget:self action:@selector(ValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:sliderRed];
    
    UISlider *sliderGreen = [[UISlider alloc] initWithFrame:CGRectMake(40, 200, size.width-80, 50)];
    sliderGreen.tag = 20;
    sliderGreen.minimumValue = 0;
    sliderGreen.maximumValue = 255.0f;
    sliderGreen.value = 0;
    sliderGreen.tintColor = [UIColor redColor];
    [sliderGreen addTarget:self action:@selector(ValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderGreen];
    
    UISlider *sliderBlue = [[UISlider alloc] initWithFrame:CGRectMake(40, 300, size.width-80, 50)];
    sliderBlue.tag = 30;
    sliderBlue.minimumValue = 0;
    sliderBlue.maximumValue = 255.0f;
    sliderBlue.value = 0;
    sliderBlue.tintColor = [UIColor redColor];
    [sliderBlue addTarget:self action:@selector(ValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:sliderBlue];
}

- (void)ValueChanged:(UISlider *)slider
{
    // 把控制颜色的三个滑块取出来
    UISlider *red = (id)[self.view viewWithTag:10];
    UISlider *green = (id)[self.view viewWithTag:20];
    UISlider *blue = (id)[self.view viewWithTag:30];
    
    UIColor *color = [UIColor colorWithRed:red.value/255.0 green:green.value/255.0 blue:blue.value/255.0 alpha:1];
    self.view.backgroundColor = color;
}

@end
