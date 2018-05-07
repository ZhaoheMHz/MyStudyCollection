//
//  AppDelegate.m
//  02-UIButton组件
//
//  Created by 哲 肖 on 16/1/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    //1.创建
    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    //2.建立父子关系
    [self.window addSubview:btn1];
    //3.设置正确的Frame
    btn1.frame = CGRectMake(100, 100, 100, 50);
    btn1.backgroundColor = [UIColor yellowColor];
    
    //4.添加监听事件
    //UIButton 可以相应用户的基本事件
    //1.点击 UIControlEventTouchUpInside 是最为常用的,几乎每天都要用到
    //2.拖拽等操作
    [btn1 addTarget:self action:@selector(btn1Touch:) forControlEvents:UIControlEventTouchUpInside];
   
    //专门用来做临时标记的值,方便我们用来去分,不同的组件
    btn1.tag = 1;
    
    UIButton * btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.window addSubview:btn2];
    btn2.frame = CGRectMake(100, 200, 100, 50);
    btn2.backgroundColor = [UIColor redColor];
    
//    [btn2 addTarget:self action:@selector(btn2Touch) forControlEvents:UIControlEventTouchUpInside];
    [btn2 addTarget:self action:@selector(btn1Touch:) forControlEvents:UIControlEventTouchUpInside];
    btn2.tag = 2;
    
    
    return YES;
}

- (void)btn2Touch
{
    NSLog(@"红色按钮触发事件");
}

- (void)btn1Touch:(UIButton *)sender
{
//    NSLog(@"%p ",sender);
//    
//    
//    NSLog(@"点击了按钮");
    //通过tag值,来区分不同的按钮激发当前逻辑
    NSInteger tag = sender.tag;
    if(tag == 1)
    {
        NSLog(@"d点击了黄色按钮");
        
    }
    else if (tag == 2)
    {
        NSLog(@"点击了红色按钮");
        
    }
}



//UIButton的基本设置
- (void)test1
{
    //专门用来处理用户的点击交互事件的
    //1.创建UIButton组件
    UIButton * btn = [[UIButton alloc] init];
    //2.建立父子关系
    [self.window addSubview:btn];
    //3.设置正确的Frame值
    btn.frame = CGRectMake(0, 100, 176, 80);
    
    //    btn.backgroundColor = [UIColor redColor];
    
    //UIControlState
    //一个按钮,都有3种常用的状态
    //1.自然(默认)状态 UIControlStateNormal
    //2.高亮状态 UIControlStateHighlighted
    //3.选中状态 UIControlStateSelected
    //设置默认状态下显示的文字
    [btn setTitle:@"请点击我" forState:UIControlStateNormal];
    //设置高亮状态下显示文字的内容
    [btn setTitle:@"点了" forState:UIControlStateHighlighted];
    
    //UIImage 对象是专门用来加载程序中图片的对象
    //设置默认状态下显示的背景图片
    UIImage * normalImage = [UIImage imageNamed:@"btn_normal"];
    [btn setBackgroundImage:normalImage forState:UIControlStateNormal];
    
    //设置高亮状态下显示的背景图片
    UIImage * highlightedImage = [UIImage imageNamed:@"btn_press"];
    [btn setBackgroundImage:highlightedImage forState:UIControlStateHighlighted];
    //设置不同状态下文字显示的具体颜色
    [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    //设置文字大小
    btn.titleLabel.font = [UIFont systemFontOfSize:30];

}

- (void)test2
{
    //UIButtonTypeInfoLight 系统提供的一些基本样式
    //UIButtonTypeCustom 自定UIButton对象
    //1.创建
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    //2.建立父子关系
    [self.window addSubview:btn];
    //3.
    btn.frame = CGRectMake(100, 100, 150, 100);
    
    //4.设置提示小图标
    //默认状态下,是小图标在左边,文字显示在右边
    [btn setImage:[UIImage imageNamed:@"test"] forState:UIControlStateNormal];
    [btn setTitle:@"礼物" forState:UIControlStateNormal];
    
    //设置内容边距
    // CGFloat top, left, bottom, right;
    //整体调整UIButton显示内容的边距
    //    btn.contentEdgeInsets = UIEdgeInsetsMake(-10, -50, 0, 0);
    
    //局部调整内容的边距
    //调整提示图片的边距
    btn.imageEdgeInsets = UIEdgeInsetsMake(-50, 0, 0, 0);
    //设置文字的边距
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, -100, -50, 0);
    
    btn.backgroundColor = [UIColor redColor];
}

@end
