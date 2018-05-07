//
//  GPTwoViewController.m
//  01-模态方式跳转页面
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTwoViewController.h"

@interface GPTwoViewController ()

@end

@implementation GPTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self
                                 action:@selector(closeItemTouch)];
    
}

- (void)closeItemTouch
{
    [self back];
}

- (void)back
{
    //关闭当前persent出来的页面
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self back];
}





@end
