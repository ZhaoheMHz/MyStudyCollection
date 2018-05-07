//
//  GPTwoViewController.m
//  03-默认是图与xib文件之间的不关联
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTwoViewController.h"

@interface GPTwoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end

@implementation GPTwoViewController


- (void)setHeroName:(NSString *)heroName
{
    
    NSLog(@"setHeroName");
    _heroName = heroName;
    //更改nameLabel的内容
    self.nameLabel.text = heroName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad");

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
