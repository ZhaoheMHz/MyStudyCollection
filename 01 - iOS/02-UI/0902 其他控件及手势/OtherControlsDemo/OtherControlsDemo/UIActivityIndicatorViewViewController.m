//
//  UIActivityIndicatorViewViewController.m
//  OtherControlsDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "UIActivityIndicatorViewViewController.h"

@interface UIActivityIndicatorViewViewController ()
{
    UIActivityIndicatorView *_waitView;
}
@end

@implementation UIActivityIndicatorViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (_waitView == nil) {
        // 不存在才创建
        _waitView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
//        UIActivityIndicatorViewStyleWhiteLarge        大白
//        UIActivityIndicatorViewStyleWhite             小白
//        UIActivityIndicatorViewStyleGray              小灰
        _waitView.transform = CGAffineTransformMakeScale(3, 3);
        _waitView.center = self.view.center;
        [self.view addSubview:_waitView];
    }
    
    // 启动动画,开始转圈
    [_waitView startAnimating];
    
    // 系统自带的小菊花,有网络请求时让他显示
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    // 停止动画
    [_waitView stopAnimating];
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end
