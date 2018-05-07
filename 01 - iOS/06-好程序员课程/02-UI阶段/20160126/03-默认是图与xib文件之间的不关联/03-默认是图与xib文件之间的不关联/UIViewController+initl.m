//
//  UIViewController+initl.m
//  03-默认是图与xib文件之间的不关联
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "UIViewController+initl.h"

@implementation UIViewController (initl)

+ (id)controller
{
    UIViewController * viewController = [[self alloc] init];
    //创建完成控制器,就立即创建默认视图
    viewController.view.backgroundColor = [UIColor whiteColor];
    return viewController;
}

@end
