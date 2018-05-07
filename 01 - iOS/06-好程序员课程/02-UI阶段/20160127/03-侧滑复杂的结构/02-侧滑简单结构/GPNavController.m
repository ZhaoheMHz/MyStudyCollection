//
//  GPNavController.m
//  02-侧滑简单结构
//
//  Created by 哲 肖 on 16/1/27.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPNavController.h"
#import "UIViewController+split.h"

@interface GPNavController ()

@end

@implementation GPNavController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    
    
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //在push之前,为每一个控制器添加一个按钮,
    //第一个被导航控制器管理的视图控制器上添加一个按钮
    if(self.viewControllers.count == 0)
    {
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"展开" style:UIBarButtonItemStylePlain target:self action:@selector(leftItemTouch)];
    }
    
    [super pushViewController:viewController animated:YES];
}

- (void)leftItemTouch
{
    
//    GPTabController * tabController = self.parentViewController;
    //self = GPNavController对象
    //self.parentViewController 就是GPTabController对象
    //GPTabController 继承自UIViewController
    //我们给UIViewController+split.h 也就相当于GPTabController有了这个扩展
    NSLog(@"%@",self.parentViewController);
    
    [self.parentViewController splitView];
}


@end
