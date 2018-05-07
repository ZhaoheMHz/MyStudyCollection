//
//  GPTabbarController.m
//  04-标签控制器
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTabbarController.h"
#import "GPOneViewController.h"

@interface GPTabbarController ()

@end

@implementation GPTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //可以把不同分类的控制器交给标签控制器管理
    
    //创建多个控制器对象
    GPOneViewController * oneViewController = [[GPOneViewController alloc] init];
    oneViewController.view.backgroundColor = [UIColor redColor];
    [self setItemImageWithController:oneViewController image:@"tabbar_account" selectedImage:@"tabbar_account_press" title:@"oneView"];
    UINavigationController * navOne = [[UINavigationController alloc] initWithRootViewController:oneViewController];
    
    
    //    oneViewController.tabBarItem.title = @"oneView";
    //    //设置normal状态下显示的图片
    //    oneViewController.tabBarItem.image = [UIImage imageNamed:@"tabbar_account"];
    //    oneViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_account_press"];
    //
    
    UIViewController * twoViewController = [[UIViewController alloc] init];
    twoViewController.view.backgroundColor = [UIColor greenColor];
    //    twoViewController.tabBarItem.title = @"twoView";
    [self setItemImageWithController:twoViewController image:@"tabbar_appfree" selectedImage:@"tabbar_appfree_press" title:@"twoView"];
    
    UINavigationController * navTwo = [[UINavigationController alloc] initWithRootViewController:twoViewController];
    
    
    UIViewController * threeViewController = [[UIViewController alloc] init];
    threeViewController.view.backgroundColor = [UIColor purpleColor];
    //    threeViewController.tabBarItem.title = @"threeView";
    [self setItemImageWithController:threeViewController image:@"tabbar_rank" selectedImage:@"tabbar_rank_press" title:@"threeView"];
    
    UINavigationController * navThree = [[UINavigationController alloc] initWithRootViewController:threeViewController];
    
    
    //交给自己管理
    self.viewControllers = @[navOne,navTwo,navThree];
    
}


- (void)setItemImageWithController:(UIViewController *)viewController image:(NSString * )image selectedImage:(NSString *)selectedImage title:(NSString *)title
{
    
    viewController.tabBarItem.title = title;
    
    
    UIImage * normalImage = [UIImage imageNamed:image];
    
    normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = normalImage;
    
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    
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
