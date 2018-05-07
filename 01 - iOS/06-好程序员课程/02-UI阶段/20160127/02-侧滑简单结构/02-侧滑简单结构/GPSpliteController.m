//
//  GPSpliteController.m
//  02-侧滑简单结构
//
//  Created by 哲 肖 on 16/1/27.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPSpliteController.h"
#import "GPRootController.h"
#import "GPMenu1ViewController.h"
#import "GPMenu2ViewController.h"

@interface GPSpliteController ()

@property (nonatomic,weak)GPRootController * rootController;

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
    
    
    
    
    //添加子控制器
    GPRootController * rootController = [[GPRootController alloc] init];
    self.rootController = rootController;
    
    UINavigationController * navRootViewController = [[UINavigationController alloc] initWithRootViewController:rootController];
    
    //建立控制器之间的父子关系
    [self addChildViewController:navRootViewController];
    [self.view addSubview:navRootViewController.view];
}

- (void)menuButtonTouch:(UIButton *)btn
{
    if(btn.tag == 1)
    {
        NSLog(@"点击了menu1");
        //1.创建控制器
        GPMenu1ViewController * menu1ViewController = [[GPMenu1ViewController alloc] init];
        //2.push
        //获得导航控制其对象
        [self.rootController.navigationController pushViewController:menu1ViewController animated:YES];
        //3.视图归位呀
        [self.rootController spliteView];
        
    }
    else
    {
        NSLog(@"点击了menu2");
        GPMenu2ViewController * menu2ViewController = [[GPMenu2ViewController alloc] init];
        //2.push
        [self.rootController.navigationController pushViewController:menu2ViewController animated:YES];
        [self.rootController spliteView];
    }
}


@end
