//
//  GPSettingController.m
//  03-权限控制
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPSettingController.h"
#import "GPSettingDetailController.h"

@interface GPSettingController ()

@end

@implementation GPSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btnTouch:(id)sender {
    
    GPSettingDetailController * detailController = [[GPSettingDetailController alloc] init];
    [self.navigationController pushViewController:detailController animated:YES];
    
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
