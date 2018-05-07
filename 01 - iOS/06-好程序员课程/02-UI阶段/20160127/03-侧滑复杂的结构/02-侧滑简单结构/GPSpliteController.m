//
//  GPSpliteController.m
//  02-侧滑简单结构
//
//  Created by 哲 肖 on 16/1/27.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPSpliteController.h"

#import "GPMenu1ViewController.h"
#import "GPMenu2ViewController.h"

#import "GPTabController.h"
#import "UIViewController+split.h"

@interface GPSpliteController ()


@property(nonatomic, weak)GPTabController * tabController;


@end

@implementation GPSpliteController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    self.view.backgroundColor = [UIColor whiteColor];
    
    //1.添加两个菜单按钮
    
    UIButton * menu1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:menu1];
    menu1.frame = CGRectMake(20, 100, 100, 50);
    [menu1 setTitle:@"menu1" forState:UIControlStateNormal];
    [menu1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    menu1.tag = 1;
    [menu1 addTarget:self action:@selector(menuButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * menu2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:menu2];
    menu2.frame = CGRectMake(20, 160, 100, 50);
    [menu2 setTitle:@"menu2" forState:UIControlStateNormal];
    [menu2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    menu2.tag = 2;
    [menu2 addTarget:self action:@selector(menuButtonTouch:) forControlEvents:UIControlEventTouchUpInside];
    
    
    //添加tabbar控制器
    GPTabController * tabController = [[GPTabController alloc] init];
    tabController.view.backgroundColor = [UIColor whiteColor];
    self.tabController = tabController;
    
    //建立控制器之间的父子关系,只是保存了一个子控制器的请指针,不会主动的把子控制器的视图,添加到父亲默认视图上显示出来,还需要我们自己主动添加
    [self addChildViewController:tabController];
    [self.view addSubview:tabController.view];
    
  
}

- (void)menuButtonTouch:(UIButton *)btn
{
    
    if(btn.tag == 1)
    {
        //1.创建控制器对象
        GPMenu1ViewController * menu1ViewController = [[GPMenu1ViewController alloc] init];
        menu1ViewController.hidesBottomBarWhenPushed = YES;
        //2.push
        //找到导航控制器,push
        //或者是视图控制器self.navigationController
        UINavigationController * viewController = (UINavigationController *)self.tabController.selectedViewController;
        [viewController pushViewController:menu1ViewController animated:YES];
        //3.视图归位,归谁的位(GPTabController)
        [self.tabController splitView];
        
    }
    else
    {
        GPMenu2ViewController * menu2ViewController = [[GPMenu2ViewController alloc] init];
        menu2ViewController.hidesBottomBarWhenPushed = YES;
        //2.push
        //找到导航控制器,push
        //或者是视图控制器self.navigationController
        UINavigationController * viewController = (UINavigationController *)self.tabController.selectedViewController;
        [viewController pushViewController:menu2ViewController animated:YES];
        //3.视图归位,归谁的位(GPTabController)
        [self.tabController splitView];
    }
    
}


@end
