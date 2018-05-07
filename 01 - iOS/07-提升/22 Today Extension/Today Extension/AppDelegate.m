//
//  AppDelegate.m
//  Today Extension
//
//  Created by 赵赤赤 on 2016/9/21.
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

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:[url query] message:nil delegate:nil cancelButtonTitle:nil otherButtonTitles:nil, nil];
    [av show];
    
    return YES;
}


@end
