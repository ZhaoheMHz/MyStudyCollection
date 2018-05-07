//
//  TouchViewController.m
//  GestureDemo
//
//  Created by 赵赤赤 on 15/9/2.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "TouchViewController.h"

@interface TouchViewController ()
{
    CGRect _kittyFrame;
    CGPoint _startPoint;
}
@end

@implementation TouchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

// 触摸开始的时候
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _kittyFrame = [self getHelloKitty].frame;
    
    // 找到触摸
    UITouch *touch = touches.anyObject;
    // 得到触摸的开始位置
    _startPoint = [touch locationInView:self.view];
    
    
    // 获取所有的触摸
    NSSet *touchSet = [event allTouches];
    for (UITouch *tc in touchSet) {
        CGPoint p = [tc locationInView:self.view];
        NSLog(@"%@", NSStringFromCGPoint(p));
    }
}

// 触摸移动中
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = touches.anyObject;
    
    // 得到触摸的当前位置
    CGPoint point = [touch locationInView:self.view];
    // 横向偏移量
    CGFloat moveX = point.x-_startPoint.x;
    // 纵向偏移量
    CGFloat moveY = point.y-_startPoint.y;
    
    UIImageView *kitty = [self getHelloKitty];
    kitty.frame = CGRectMake(_kittyFrame.origin.x+moveX, _kittyFrame.origin.y+moveY, _kittyFrame.size.width, _kittyFrame.size.height);
}

// 触摸结束
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

// 触摸取消,来电打动
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}
@end
