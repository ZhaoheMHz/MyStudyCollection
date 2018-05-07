//
//  GPTabController.m
//  02-侧滑简单结构
//
//  Created by 哲 肖 on 16/1/27.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTabController.h"
#import "GPOneController.h"
#import "GPThreeController.h"
#import "GPTwoController.h"
#import "GPNavController.h"

@interface GPTabController ()

@end

@implementation GPTabController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    //1.one
    GPOneController * oneController = [[GPOneController alloc] init];
    [self setController:oneController title:@"one"];
    //2.
    GPTwoController * twoController = [[GPTwoController alloc] init];
    [self setController:twoController title:@"two"];
    //3.
    GPThreeController * threeController = [[GPThreeController alloc] init];
    [self setController:threeController title:@"three"];
    
}

- (void)setController:(UIViewController *)controller title:(NSString *)title
{
    //如果需要同时设置,导航上的标题,与item上的标题
    //那么我们可以直接使用title属性,他是简化设置两个之间title属性
    controller.title = title;//等同于下面两句代码
//    controller.navigationItem.title = title;
//    controller.tabBarItem.title = title;
    
    //导航控制器管理,视图控制器
    GPNavController * navController = [[GPNavController alloc] initWithRootViewController:controller];
    //标签控制器管理,导航控制器
    [self addChildViewController:navController];
    
    
}//end method

@end
