//
//  AppDelegate.m
//  MagicalRecordDemo
//
//  Created by 赵赤赤 on 15/12/18.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "AppDelegate.h"
#import <MagicalRecord/MagicalRecord.h>
#import <MagicalRecord/MagicalRecord+ShorthandMethods.h>
#import <MagicalRecord/MagicalRecordShorthandMethodAliases.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 初始化MagicalRecord
    [MagicalRecord setupCoreDataStackWithStoreNamed:@"MyDatabase.sqlite"];
    
    return YES;
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // 清理
    [MagicalRecord cleanUp];
}

@end
