//
//  DynamicView.m
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "DynamicView.h"

@implementation DynamicView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //1.设置网格背景
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"Background"]];
        
        //2.设置仿真者
        UIImageView *box = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Box"]];
        box.center = self.center;
        self.box = box;
        [self addSubview:box];
        
        
        //3.初始化仿真器
        _animator = [[UIDynamicAnimator alloc]initWithReferenceView:self];
        
    }
    return self;
}



@end
