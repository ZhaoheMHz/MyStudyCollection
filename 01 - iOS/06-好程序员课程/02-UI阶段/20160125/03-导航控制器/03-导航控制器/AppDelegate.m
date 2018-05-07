//
//  AppDelegate.m
//  03-导航控制器
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "AppDelegate.h"
#import "GPOneViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    GPOneViewController * viewController = [[GPOneViewController alloc] init];
    viewController.view.backgroundColor = [UIColor redColor];
    
    //initWithRootViewController 第一个交给导航控制器管理的视图控制器对象是谁
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    NSLog(@"UINavigationController %p",navController);
    
    self.window.rootViewController = navController;
    
    return YES;
}

- (void)test
{
    /*
     UIViewController * viewController = [[UIViewController alloc] init];
     viewController.view.backgroundColor = [UIColor redColor];
     self.window.rootViewController = viewController;
     */
    
    //1.他是继承自UIViewController的类,一定有默认视图_view(特殊的默认视图)
    //2.默认视图上有一个组件( UINavigationBar)
    //3.UINavigationBar上可以添加按钮(UIBarButtonItem)
    //4.导航控制器,会把最后一个交给他管理的控制器默认视图显示在页面上
    //5.通过返回按钮,离开当前显示页面的视图,以及视图控制器会被销毁,如果想要再一次显示该控制器内容,那么就需要重新创建,会把控制器对象的指针从viewControllers数组当中删除掉
    //6.导航控制当前显示的页面,永远是viewControllers最后一个存进去的,也就是永远是数组的最后一个元素
    
    UINavigationController * navController = [[UINavigationController alloc] init];
    
    UIViewController * viewController = [[UIViewController alloc] init];
    viewController.view.backgroundColor  = [UIColor orangeColor];
    
    UIViewController * viewCont2 = [[UIViewController alloc] init];
    viewCont2.view.backgroundColor = [UIColor greenColor];
    
    
    UIViewController * viewCont3 = [[UIViewController alloc] init];
    viewCont3.view.backgroundColor = [UIColor purpleColor];
    
    //    NSArray * tmpArray1 = navController.viewControllers;
    //    NSLog(@"%ld",tmpArray1.count);
    
    /*
     //调用pushViewController方法,把控制器交给导航控制器管理
     //1.把添加进去的控制器视图,拿到自己上面显示
     //2.保存一个该控制器的强指针
     //3.会把该控制器保存到viewControllers数组中
     [navController pushViewController:viewController animated:NO];
     [navController pushViewController:viewCont2 animated:NO];
     [navController pushViewController:viewCont3 animated:NO];
     */
    //
    //    NSArray * tmpArray = navController.viewControllers;
    //    NSLog(@"%ld",tmpArray.count);
    
    
    
    

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
