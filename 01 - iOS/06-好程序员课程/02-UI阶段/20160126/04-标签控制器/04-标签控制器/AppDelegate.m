//
//  AppDelegate.m
//  04-标签控制器
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "AppDelegate.h"
#import "GPTabbarController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //1.标签控制器
    //UITabBarController 继承自UIViewController
    //组要用来管理app中的分类
    //组成部分:
    //1.UITabBar
    //2.UITabBarItem(管理标签上的按钮)
    GPTabbarController * tabbarController = [[GPTabbarController alloc] init];
    
    //把标签控制器设置为根视图控制器
    self.window.rootViewController = tabbarController;
    
    
    
    
    
    return YES;
}

- (void)test
{
    
    /*
     //可以把不同分类的控制器交给标签控制器管理
     
     //创建多个控制器对象
     UIViewController * oneViewController = [[UIViewController alloc] init];
     oneViewController.view.backgroundColor = [UIColor redColor];
     [self setItemImageWithController:oneViewController image:@"tabbar_account" selectedImage:@"tabbar_account_press" title:@"oneView"];
     //    oneViewController.tabBarItem.title = @"oneView";
     //    //设置normal状态下显示的图片
     //    oneViewController.tabBarItem.image = [UIImage imageNamed:@"tabbar_account"];
     //    oneViewController.tabBarItem.selectedImage = [UIImage imageNamed:@"tabbar_account_press"];
     //
     
     UIViewController * twoViewController = [[UIViewController alloc] init];
     twoViewController.view.backgroundColor = [UIColor greenColor];
     //    twoViewController.tabBarItem.title = @"twoView";
     [self setItemImageWithController:twoViewController image:@"tabbar_appfree" selectedImage:@"tabbar_appfree_press" title:@"twoView"];
     
     
     UIViewController * threeViewController = [[UIViewController alloc] init];
     threeViewController.view.backgroundColor = [UIColor purpleColor];
     //    threeViewController.tabBarItem.title = @"threeView";
     [self setItemImageWithController:threeViewController image:@"tabbar_rank" selectedImage:@"tabbar_rank_press" title:@"threeView"];
     */
    
    //把控制器对象,交给标签控制器管理
    //    tabbarController.viewControllers = @[oneViewController,twoViewController,threeViewController];
    //设置tabbar的背景图片
    //    [tabbarController.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_bg"]];
}
- (void)setItemImageWithController:(UIViewController *)viewController image:(NSString * )image selectedImage:(NSString *)selectedImage title:(NSString *)title
{

    viewController.tabBarItem.title = title;
    
    
    UIImage * normalImage = [UIImage imageNamed:image];
    
    normalImage = [normalImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.image = normalImage;
    
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
