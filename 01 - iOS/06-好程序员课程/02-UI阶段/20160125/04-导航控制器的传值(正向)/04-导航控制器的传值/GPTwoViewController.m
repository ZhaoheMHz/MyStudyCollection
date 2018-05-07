//
//  GPTwoViewController.m
//  04-导航控制器的传值
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTwoViewController.h"

@interface GPTwoViewController ()

@end

@implementation GPTwoViewController

+(id)twoViewControllerWithNameTitle:(NSString *)nameTitle
{
    GPTwoViewController * towViewController = [[GPTwoViewController alloc] init];
    towViewController.nameText = nameTitle;
    return towViewController;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor grayColor];
    
    
    UILabel * labelName = [[UILabel alloc] init];
    [self.view addSubview:labelName];
    labelName.frame= CGRectMake(100, 200, 200, 40);
    labelName.text = self.nameText;
    
    //通过key标记,在全局plist文件中,取出一个值
    NSUserDefaults * udf = [NSUserDefaults standardUserDefaults];
    NSString * nameText = [udf objectForKey:@"name"];
    
    labelName.text = nameText;
    
    
    
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
