//
//  AppDelegate.m
//  03-UIView与UIViewController基本概念
//
//  Created by 哲 肖 on 16/1/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "AppDelegate.h"
#import "GPBookListViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //UIView 是基础视图组件,所有能够看得到,摸得到的组件都继承自UIView
    //UIWindow,UILabel,UIButton,都是直接或者间接继承自UIView
    
    //UIWindow 直接继承UIView
    //UILabel 直接继承UIView
    //UIButton ->UIControl->UIView 间接的继承UIView
    //UIControl使得UIButton具备了监听用户点击事件的能力
    
    //UIView 在开发中,我们经常把他作为一个容器来用,把一些列的能够独立表达某种意义的组件,组合起来完成UI页面的搭建
    //把所有组件中能够用到的属性,都定义在了自己的内部
    //Frame属性,backgroundColor,tag,addSubView方法
    
    /*
    //1.创建对象
    UIView * view = [[UIView alloc] init];
    //2.建立父子关系
    [self.window addSubview:view];
    //3.设置正确的Frame
    view.frame = CGRectMake(100, 100, 100, 100);
    view.backgroundColor = [UIColor redColor];
    */
    //UIViewController 专门用来管理视图的
    //在实际的开发中,我们会把复杂的逻辑全部写在视图控制器内部,而不是在AppDelegate中完成,这样能够更好的进行代码的管理
    
//    UIImage * image = [UIImage imageNamed:@"abf"];
//    //image 转换成UIColor
//    UIColor * backg =  [UIColor colorWithPatternImage:image];
//    self.window.backgroundColor = backg;
    
    /*
    //所有的控制中,都管理着一个默认的视图,专门给我们来做容器用的
    //控制器管理的默认视图,大小是与屏幕大小一样的
    UIViewController * controller = [[UIViewController alloc] init];
    UIView * view = controller.view;
    view.backgroundColor = [UIColor orangeColor];
    
    [self.window addSubview:view];
    */
//    UIViewController * controller = [[UIViewController alloc] init];
//    controller.view.backgroundColor = [UIColor greenColor];
    
//    self.window.rootViewController = [[UIViewController alloc] init];
    
    
    
    self.window.rootViewController = [[GPBookListViewController alloc] init];
    
    
    return YES;
}
/*
- (void)setRootViewController:(UIViewController *)viewController

{
    [self addSubView:viewController.view];
}
*/

@end
