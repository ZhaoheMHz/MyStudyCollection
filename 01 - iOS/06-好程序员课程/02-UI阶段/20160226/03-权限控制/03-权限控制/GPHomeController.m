//
//  GPHomeController.m
//  03-权限控制
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPHomeController.h"
#import "GPHomeDetailController.h"

@interface GPHomeController ()

@end

@implementation GPHomeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)btnTouch:(id)sender
{
    
    GPHomeDetailController * homeDetail = [[GPHomeDetailController alloc] init];
//    [homeDetail class]; = GPHomeDetailController
    [self.navigationController pushViewController:homeDetail animated:YES];

}

@end
