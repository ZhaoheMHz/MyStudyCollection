//
//  AppDelegate.m
//  3DTouchDemo
//
//  Created by baoxu on 16/1/21.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

/**
 1.首先我们需要在Info.plist文件中加上一项
    UIApplicationShortcutItems---[array]
        Item0---[dict]
        UIApplicationShortcutItemIconType---[string]---(值)
        UIApplicationShortcutItemTitle---[string]---(值)
        UIApplicationShortcutItemType---[string]---(值)
        [/dict]
    [/array]

    说明：
    UIApplicationShortcutItemIconType(触发3D Touch时显示的图标类型--系统){
        UIApplicationShortcutIconTypeSearch
        UIApplicationShortcutIconTypeShare
        UIApplicationShortcutIconTypeAdd
        ...
    }
    UIApplicationShortcutItemIconFile（触发3D Touch时显示的图标类型--自定义）{
        //图片名
        action_bar_icon_scanner_dark.png
    }
    UIApplicationShortcutItemTitle（显示名字）{
        自定义
        最新活动
    }
    UIApplicationShortcutItemType（相当于项目中的Bundle Identifier唯一的，必须要有的，通过这个标示我们可以判断点相应的那一项触发相应的操作，可以多设置几个）{
        自定义
        activity
    }
*/

#import "AppDelegate.h"
#import "ScanningViewController.h"
#import "ViewController.h"
#import "AddViewController.h"
#import "SearchViewController.h"

@interface AppDelegate ()
@property (nonatomic, strong) UIApplicationShortcutItem *currentShortItem;
@property (strong, nonatomic) UINavigationController *nvc;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    ViewController *vc = [[ViewController alloc]init];
    
    _nvc = [[UINavigationController alloc]initWithRootViewController:vc];
    
    self.window.rootViewController = _nvc;
    
    [self.window makeKeyAndVisible];
    
    //判断是否是从shortitem启动的程序
    if (launchOptions[@"UIApplicationLaunchOptionsShortcutItemKey"]) {
        _currentShortItem = launchOptions[@"UIApplicationLaunchOptionsShortcutItemKey"];
        //这个返回值很重要、返回no，不会再调用performActionForShortcutItem这个回调方法
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:[_currentShortItem description]delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil];
        [alert show];
    }

    return YES;
}


#pragma mark - 3Dtouch响应
//响应用户的快捷方式操作（即3dtouch）
-(void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler{

    [self handleItem:shortcutItem];
}

-(void)handleItem:(UIApplicationShortcutItem *)shortItem{
    //处理shortitem事件
    if ([shortItem.type isEqualToString:@"add"]) {
        AddViewController* sVC = [[AddViewController alloc]init];
        [_nvc pushViewController:sVC animated:YES];
    }else if ([shortItem.type isEqualToString:@"search"]){
        SearchViewController * sVC = [[SearchViewController alloc]init];
        [_nvc pushViewController:sVC animated:YES];

    } else if ([shortItem.type isEqualToString:@"scanning"]) {
        ScanningViewController * sVC = [[ScanningViewController alloc]init];
        sVC.hidesBottomBarWhenPushed = YES;
        [_nvc pushViewController:sVC animated:YES];
    }
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
