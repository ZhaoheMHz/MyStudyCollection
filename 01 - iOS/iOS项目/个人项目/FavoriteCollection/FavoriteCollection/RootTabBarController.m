//
//  RootTabBarController.m
//  FavoriteCollection
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "RootTabBarController.h"
#import "ShowViewController.h"

@interface RootTabBarController ()

@end

@implementation RootTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ShowViewController *vc1 = [[ShowViewController alloc] init];
    ShowViewController *vc2 = [[ShowViewController alloc] init];
    ShowViewController *vc3 = [[ShowViewController alloc] init];
    ShowViewController *vc4 = [[ShowViewController alloc] init];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:vc1];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:vc2];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:vc3];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:vc4];
    
    NSArray *navArray = @[nav1, nav2, nav3, nav4];
    
    self.viewControllers = navArray;
    
    // 设置标题
    UIImage *image1 = [[UIImage imageNamed:@"1.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc1.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:K_TITLE_1 image:image1 selectedImage:nil];
    
    UIImage *image2 = [[UIImage imageNamed:@"2.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:K_TITLE_2 image:image2 selectedImage:nil];
    
    UIImage *image3 = [[UIImage imageNamed:@"3.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc3.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:K_TITLE_3 image:image3 selectedImage:nil];
    
    UIImage *image4 = [[UIImage imageNamed:@"4.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc4.navigationController.tabBarItem = [[UITabBarItem alloc] initWithTitle:K_TITLE_4 image:image4 selectedImage:nil];
    
    
}

@end
