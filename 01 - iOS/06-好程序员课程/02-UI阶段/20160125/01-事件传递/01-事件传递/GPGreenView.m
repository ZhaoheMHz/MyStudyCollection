//
//  GPGreenView.m
//  01-事件传递
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPGreenView.h"

@implementation GPGreenView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //UITouch 用户的手指,用户手指触控到屏幕,系统就会自动创建一个UITouch对象,并且在内部记录下来用户,触控的位置
    //UITouch对象被存储在 touches 中
    UITouch * touch = [touches anyObject];
    
    //参考当前(自己)视图的坐标系,用户的触控位置应该在哪里
    CGPoint currentPoint = [touch locationInView:self];
//    NSLog(@"point %@",NSStringFromCGPoint(currentPoint));
    
//    NSLog(@"%@ %@,%@",_name,NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
//    NSLog(@"%@ %@,%@",_name,NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    
    //touchesMoved 方法中
    //1.可以获得手指当前坐标位置
    //2.可以获得移动之前的一个位置
    UITouch * touch = [touches anyObject];
    
    CGPoint  currentPoint = [touch locationInView:self];
    CGPoint  prePoint = [touch previousLocationInView:self];
    
//    NSLog(@"currentpoint %@,prePoint %@",NSStringFromCGPoint(currentPoint),NSStringFromCGPoint(prePoint));
    
    //跟随操作
    //1.手指在屏幕上移动的差值
    //2.让Frame,x,y坐标增加差值范围
    //3.更新Frame
    CGRect rect = self.frame;
    rect.origin.x += currentPoint.x - prePoint.x;
    rect.origin.y += currentPoint.y - prePoint.y;
    
    //self.bounds? 代表的是什么呢?
    self.frame = rect;

    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
//      NSLog(@"%@ %@,%@",_name,NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

@end
