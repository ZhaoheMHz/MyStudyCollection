//
//  GPOneViewController.m
//  01-模态方式跳转页面
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPOneViewController.h"
#import "GPTwoViewController.h"

@interface GPOneViewController ()

@end

@implementation GPOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    GPTwoViewController * twoViewController = [[GPTwoViewController alloc] init];
    
    UINavigationController * navTwo = [[UINavigationController alloc] initWithRootViewController:twoViewController];
    
    [self presentViewController:navTwo animated:YES completion:nil];
    
    
}

- (void)test
{
    //1.创建控制器
    GPTwoViewController * twoViewController = [[GPTwoViewController alloc] init];
    
    //    NSLog(@"twoViewController %p",twoViewController);
    
    //2.push
    //    [self.navigationController pushViewController:twoViewController animated:YES];
    
    //1.使用presentViewController 并不依赖与navigationController
    //2.通常一些权限控制器页面,比如要求用户登录我们可以直接使用presentViewController方式弹出一个页面
    //3.也就是说明,presentViewController被当前控制器所管理
    
    [self presentViewController:twoViewController animated:YES completion:nil];
    //presentViewController出来的控制器对象,被保存到了当前控制器的self.presentedViewController属性中了
    //也就是说明,presentViewController被当前控制器所管理
    
    //self.presentedViewController
    
    //    NSLog(@"presentedViewController %p",self.presentedViewController);

}



@end
