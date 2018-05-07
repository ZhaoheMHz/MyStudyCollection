//
//  GPOCListView.m
//  02-bookstore标签栏
//
//  Created by 哲 肖 on 16/1/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPOCListView.h"

@implementation GPOCListView


- (void)dealloc
{
    NSLog(@"%@ 被销毁了",NSStringFromClass([self class]));
}

+(id)ocListView
{
    return [[self alloc] init];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    self.frame = newSuperview.bounds;
    self.backgroundColor = [UIColor yellowColor];
    
}

@end
