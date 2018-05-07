//
//  UISegmentedControlViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "UISegmentedControlViewController.h"

@interface UISegmentedControlViewController ()

@end

@implementation UISegmentedControlViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createMyControl
{
    // UISegmentedControl分段控制器
    UIImage *image = [UIImage imageNamed:@"img_01"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    NSArray *items = @[@"第一段", image, @"第三段"];
    
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:items];
    sc.frame = CGRectMake(0, 200, 350, 50);
    
    // 设置镂空颜色
    sc.tintColor = [UIColor redColor];
    
    // 设置选中的段
    sc.selectedSegmentIndex = 1;
    
    // 设置段落宽度均匀分布
    sc.apportionsSegmentWidthsByContent = NO;
    
    // 设置不能选中
    sc.momentary = YES;
    
    // 设置段落宽度
//    [sc setWidth:80 forSegmentAtIndex:0];
    
    // 设置某一段不可操作
    [sc setEnabled:YES forSegmentAtIndex:0];
    
    // 反悔可否操作
    BOOL ret = [sc isEnabledForSegmentAtIndex:0];
    
    NSLog(@"%@", ret?@"可操作":@"不可操作");
    
    // 设置某一段的标题
    [sc setTitle:@"如果我是dj" forSegmentAtIndex:0];
    
    // 返回某一段的标题
//    NSString *title = [sc titleForSegmentAtIndex:0];
    
    // 返回某一段的图片
//    UIImage *image1 = [sc imageForSegmentAtIndex:1];
    
    // 设置背景图片
//    sc setBackgroundImage:(UIImage *) forState:(UIControlState) barMetrics:(UIBarMetrics)
    
    // 添加事件
    [sc addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:sc];
}

- (void)valueChanged:(UISegmentedControl *)sc
{
    // 获取选中的段下标
    switch (sc.selectedSegmentIndex) {
        case 0:
            // 增加一段
            [sc insertSegmentWithTitle:@"第四段" atIndex:3 animated:YES];
            break;
        case 1:
            // 删除一段
            [sc removeSegmentAtIndex:3 animated:YES];
            break;
        default:
            break;
    }
}

@end
