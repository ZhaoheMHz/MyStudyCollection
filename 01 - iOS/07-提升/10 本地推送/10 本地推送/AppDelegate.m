//
//  AppDelegate.m
//  10 本地推送
//
//  Created by 赵赤赤 on 16/4/7.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

/** 
 前台下，会调用这个方法，但不会有消息提示
 后台下，点击了通知栏的消息后会进入应用执行这个方法
 */
- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification {
    NSLog(@"%@", notification.alertBody);
}

@end
