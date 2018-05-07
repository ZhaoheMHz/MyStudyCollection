//
//  AppDelegate.m
//  01-事件传递
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "AppDelegate.h"
#import "GPMyWindow.h"
#import "GPTestViewController.h"

@interface AppDelegate ()

@end

/*
 
 事件响应与传递
 UIResponder 
 
 //1.首先要找到在链状结构中,最为适合处理事件相应的组件,如果该组件对事件进行到了处理,那么该事件传递(告一段路),如果最为适合相应该事件的组件没有重写(UIResponder方法),那么他会想回找第二适合处理用户相应事件的组件
 ,如果在一个链状结构中没有任何一个组件处理用户的触控事件,那么该事件将被丢弃
 UIApplication-Appdelgate->UIWindow->UIViewController->(UIView默认视图)->GPGreenView(UIResponder)
 
 UIApplication-Appdelgate->UIWindow->UIViewController->(UIView默认视图)->//GPGreenView(UIResponder)->(redView)
 
 
 */

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[GPMyWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    self.window.rootViewController = [[GPTestViewController alloc] init];
    
    return YES;
}

/**
 *  一旦用户触摸到了屏幕,就会立即执行touchesBegan
 *
 *  @param touches <#touches description#>
 *  @param event   <#event description#>
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}
/**
 *  只要用户触控发生移动,就会立即调用
 *
 *  @param touches <#touches description#>
 *  @param event   <#event description#>
 */
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}
/**
 *  用户手指离开屏幕,就会立即触发
 *
 *  @param touches <#touches description#>
 *  @param event   <#event description#>
 */
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}
/**
 *  如果用户的操作,被系统功能打断的时候会触发,来电话
 *
 *  @param touches <#touches description#>
 *  @param event   <#event description#>
 */
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
