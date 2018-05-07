//
//  GPLoginController.m
//  01-主流app结构管理
//
//  Created by 哲 肖 on 16/1/27.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPLoginController.h"

@interface GPLoginController ()

@property(nonatomic,weak)IBOutlet UITextField * nameTextField;

@end

@implementation GPLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStylePlain target:self action:@selector(closePage)];
    
}

- (void)closePage
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginButtonTouch:(id)sender
{
    //1.获得用户输入的内容
    NSString * name = self.nameTextField.text;
    //2.将内容存储到UserDefault中
    NSUserDefaults * udf = [NSUserDefaults standardUserDefaults];
    [udf setObject:name forKey:@"name"];
    [udf synchronize];
    //3.关闭当前窗口
    [self closePage];
}


@end
