//
//  SnapView.m
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "SnapView.h"

@implementation SnapView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //在执行前，删除之前的行为
    [self.animator removeAllBehaviors];
    
    //获取触摸点
    CGPoint location = [touches.anyObject locationInView:self];
    
    //创建捕捉行为
    //参数一：仿真元素，//参数二：捕捉点
    UISnapBehavior *snap = [[UISnapBehavior alloc]initWithItem:self.box snapToPoint:location];
    
    //设置震动系数（系数在0~1之间，数值越大振幅越小）
    snap.damping = 0.1;
    snap.damping = 0.9;
    snap.damping = arc4random_uniform(100)/100.0;
    
    
    //添加到仿真器中
    [self.animator addBehavior:snap];
    
}

@end
