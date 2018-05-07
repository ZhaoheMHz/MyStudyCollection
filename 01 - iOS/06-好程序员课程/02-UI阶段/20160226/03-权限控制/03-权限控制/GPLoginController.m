//
//  GPLoginController.m
//  03-权限控制
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPLoginController.h"

@interface GPLoginController ()
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@end

@implementation GPLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginBtnTouch:(id)sender {
    
    
    //1.保存用户登录信息
    NSString * name = self.nameTextField.text;
    NSUserDefaults * duf = [NSUserDefaults standardUserDefaults];
    [duf setObject:name forKey:@"name"];
    [duf synchronize];
    
    //2.回到之前的页面
    [self dismissViewControllerAnimated:YES completion:nil];
    
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
