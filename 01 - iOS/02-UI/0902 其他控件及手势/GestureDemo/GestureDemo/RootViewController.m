//
//  RootViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)createMyControl
{
    NSArray *titleArray = @[@"Touch", @"Tap", @"LongPress", @"Swipe", @"Pan", @"Rotation", @"Pinch", @"Double", @"Shake"];
    
    CGSize size = [UIScreen mainScreen].bounds.size;
    for (int i=0; i<titleArray.count; i++) {
        UIButton *button = [[UIButton alloc] init];
        button.frame = CGRectMake(20, 80+45*i, size.width-40, 40);
        button.backgroundColor = [UIColor magentaColor];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}

- (void)buttonClicked:(UIButton *)button
{
    NSString *className = [NSString stringWithFormat:@"%@ViewController", button.titleLabel.text];
    // 通过类名得到类
    Class aClass = NSClassFromString(className);
    
    UIViewController *vc = [[aClass alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}

@end
