//
//  AppDelegate.h
//  02_NSURLSessionType
//
//  Created by baoxu on 16/3/4.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
//传递block
@property (weak, nonatomic) void (^backgroundSessionCompletionHandel)();

@end

