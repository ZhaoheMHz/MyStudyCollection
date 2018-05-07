//
//  GPRedController.m
//  03-视图控制器之间的传值操作
//
//  Created by 哲 肖 on 16/2/23.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPRedController.h"

@interface GPRedController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation GPRedController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.nameLabel.text = self.name;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
