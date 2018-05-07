//
//  ViewController.m
//  10 本地推送
//
//  Created by 赵赤赤 on 16/4/7.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 先开启推送
    [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeNone categories:nil]];

    UILocalNotification *localNoti = [[UILocalNotification alloc] init];
    
    // 设置警告内容
    localNoti.alertBody = @"你该吃药了";
    
    // 设置徽标
    localNoti.applicationIconBadgeNumber = 1000;
    
    // 设置时间
    localNoti.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
    
    // 还可以设置声音，不过音频要小于30秒
    
    // 加入到本地推送队列中
    [[UIApplication sharedApplication] scheduleLocalNotification:localNoti];
    
    
}

@end
