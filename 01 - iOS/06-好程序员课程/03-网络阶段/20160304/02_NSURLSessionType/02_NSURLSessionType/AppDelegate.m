//
//  AppDelegate.m
//  02_NSURLSessionType
//
//  Created by baoxu on 16/3/4.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
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

//后台下载完成后，会通过此方法通知给程序
-(void)application:(UIApplication *)application handleEventsForBackgroundURLSession:(NSString *)identifier completionHandler:(void (^)())completionHandler{
    
    self.backgroundSessionCompletionHandel = completionHandler;
    
    
    
    //可以在这里实现一个本地通知
    
    [self presentNotification];
}

-(void)presentNotification{
    //本地通知
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    
    //设置一下触发的时间
    NSDate *fireDate = [NSDate dateWithTimeIntervalSinceNow:1];
    notification.fireDate = fireDate;
    
    //时区
    notification.timeZone = [NSTimeZone defaultTimeZone];
    
    //设置重复的间隔
    notification.repeatInterval = kCFCalendarUnitSecond;
    
    //通知内容
    notification.alertBody = @"后台下载完成";
    notification.applicationIconBadgeNumber = 1;
    
    //通知被触发播放声音
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    //通知参数
    NSDictionary *userDict = [NSDictionary dictionaryWithObject:@"可以看片了" forKey:@"key"];
    notification.userInfo = userDict;
    
    //IOS8之后，和以前不同，需要判断一下才能正确授权
    if ([[UIApplication sharedApplication] respondsToSelector:@selector(registerUserNotificationSettings:)]) {
        
        UIUserNotificationType type = UIUserNotificationTypeAlert | UIUserNotificationTypeBadge |
        UIUserNotificationTypeSound;
        UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:type categories:nil];
        
        [[UIApplication sharedApplication] registerUserNotificationSettings:settings];
    }
    //执行通知
    [[UIApplication sharedApplication]scheduleLocalNotification:notification];
    
}


-(void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notification{
    NSLog(@"notification:%@",notification);
    
    //这里能够进行数据交互
    NSString *notMess = [notification.userInfo objectForKey:@"key"];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"本地通知" message:notMess delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
    //更新徽标
    NSInteger badge = [UIApplication sharedApplication].applicationIconBadgeNumber;
    badge--;
    [UIApplication sharedApplication].applicationIconBadgeNumber = badge;
    
}

@end
