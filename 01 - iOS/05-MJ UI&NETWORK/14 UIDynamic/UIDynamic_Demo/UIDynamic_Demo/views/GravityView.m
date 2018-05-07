//
//  GravityView.m
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "GravityView.h"

@implementation GravityView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.box.center = CGPointMake(self.center.x, 100);
    }
    return self;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //1.仿真器（操场），已经在父类中实现
    
    //2.创建物理行为，并赋给执行者
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.box]];
    
    //设置重力方向
    //沿着x轴正向
    gravity.gravityDirection = CGVectorMake(1, 0);
    //向上
    gravity.gravityDirection = CGVectorMake(0, -1);
//    gravity.gravityDirection = CGVectorMake(1, 1);
    
    //设置重力的角度，默认是90°
    gravity.angle = M_PI_4;
    gravity.angle = M_PI_2;
    
    //设置重力加速度
    gravity.magnitude = 0.98;
    
    
    //3.将行为添加到仿真器中（人执行在操场上跑）
    [self.animator addBehavior:gravity];
}


@end
