//
//  GPFreeController.m
//  03-权限控制
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPFreeController.h"
#import "GPFreeDetailController.h"

@interface GPFreeController ()

@end

@implementation GPFreeController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btnTouch:(id)sender {
    
    
    GPFreeDetailController * free = [[GPFreeDetailController alloc] init];
    [self.navigationController pushViewController:free animated:YES];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
