//
//  CommonViewController.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/8/16.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "CommonViewController.h"

@interface CommonViewController ()

@end

@implementation CommonViewController

// 重写该方法后，子类会去继承这个方法，这样子类可以直接加载父类的xib文件
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:@"CommonViewController" bundle:nibBundleOrNil]) {
        
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置自身属性
    self.view.backgroundColor = [UIColor whiteColor];
}

// 返回按钮点击事件
- (IBAction)backAction:(UIButton *)sender {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


@end
