//
//  QFAppDelegate.m
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "QFAppDelegate.h"

#import "MyTabBarController.h"

#import "LimitViewController.h"
#import "SaleViewController.h"
#import "FreeViewController.h"
#import "HotViewController.h"
#import "TopicViewController.h"

#import "NetInterface.h"

//分享需要包含的头文件
#import "UMSocial.h"
#import "UMSocialWechatHandler.h"
#import "TencentOpenAPI/QQApiInterface.h"
#import "TencentOpenAPI/TencentOAuth.h"

@implementation QFAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    
    
    
    
    //初始化友盟(UM)分享库
    [self initUMShare];

    //创建并显示标签栏
    [self createAndConfigTabBar];

    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)createAndConfigTabBar
{
    //开发流程
    //1.tabbar, 首先使用系统的实现
    //  再考虑项目中的用法
    
    //(1)第一个思考: 如何提高开发效率, 同时创建多个
    //(2)第二个思考: 把数据放到文件中, 或者从远程加载
    //(3)第三个思考: 如何封装, 便于使用者使用
    
    
    MyTabBarController *qtbc = [[MyTabBarController alloc] init];
    AppListViewController *vc1 = (AppListViewController *)[qtbc addViewControllerWithName:@"LimitViewController" title:@"限免" imageFile:@"tabbar_limitfree.png"];
    vc1.urlstring = LIMIT_URL;
    AppListViewController *vc2 = (AppListViewController *)[qtbc addViewControllerWithName:@"SaleViewController" title:@"降价" imageFile:@"tabbar_reduceprice.png"];
    vc2.urlstring = SALE_URL;
    AppListViewController *vc3 = (AppListViewController *)[qtbc addViewControllerWithName:@"FreeViewController" title:@"免费" imageFile:@"tabbar_appfree.png"];
    vc3.urlstring = FREE_URL;
    [qtbc addViewControllerWithName:@"TopicViewController" title:@"专题" imageFile:@"tabbar_subject.png"];
    AppListViewController *vc5 = (AppListViewController *)[qtbc addViewControllerWithName:@"HotViewController" title:@"热榜" imageFile:@"tabbar_rank.png"];
    vc5.urlstring = HOT_URL;
    
    
    self.window.rootViewController = qtbc;
    
    //显示图片
    UIImageView *bg = [[UIImageView alloc] initWithFrame:self.window.bounds];
    bg.image = [UIImage imageNamed:@"Default2.png"];
    [qtbc.view addSubview:bg];
    
    //动画
    //[UIView beginAnimations:@"" context:nil];
    //[UIView setAnimationDuration:5];
    //bg.alpha = 0;
    //[UIView commitAnimations];
    
    [UIView animateWithDuration:2 animations:^{
        bg.alpha = 0;
    } completion:^(BOOL finished) {
        NSLog(@"completion");
    }];
}

-(void)initUMShare
{

    
    [UMSocialData setAppKey:@"507fcab25270157b37000010"];
    
    //设置微信AppId，url地址传nil，将默认使用友盟的网址
    [UMSocialWechatHandler setWXAppId:@"wxd9a39c7122aa6516" url:nil];
    
    //设置手机QQ的AppId，url传nil，将使用友盟的网址
    [UMSocialConfig setQQAppId:@"100424468" url:nil importClasses:@[[QQApiInterface class],[TencentOAuth class]]];
    


}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
