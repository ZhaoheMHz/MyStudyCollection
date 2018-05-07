//
//  UIActionSheetViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "UIActionSheetViewController.h"

@interface UIActionSheetViewController ()<UIActionSheetDelegate>

@end

@implementation UIActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)createMyControl
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(60, 150, 200, 50)];
    [button setTitle:@"分享" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(showActionSheet:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)showActionSheet:(UIButton *)button
{
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"自毁" otherButtonTitles:@"微信好友", @"微信朋友圈", @"QQ空间", @"新浪微博", nil];
    
    // 显示到当前视图控制器的View中
    [sheet showInView:self.view];
}

// 点击某一按钮时,调用这个方法,不包含取消按钮
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            NSLog(@"自毁");
            break;
        case 1:
            NSLog(@"微信好友");
            break;
        case 2:
            NSLog(@"微信朋友圈");
            break;
        case 3:
            NSLog(@"QQ空间");
            break;
        case 4:
            NSLog(@"新浪微博");
            break;
        default:
            break;
    }
}

// 来电打断或home键,取消显示
- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
    
}

// 即将显示actionSheet
- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
    
}

// 已经显示
- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
    
}

// 点击某一按钮,actionSheet即将消失时调用
- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

// 点击某一按钮,actionSheet已经消失时调用
- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
}

@end
