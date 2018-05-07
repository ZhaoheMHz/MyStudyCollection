//
//  CustomPathView.m
//  08_CustomPath
//
//  Created by baoxu on 16/3/8.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "CustomPathView.h"

@interface CustomPathView ()
/**
 *  http://www.jianshu.com/p/734b34e82135
 使用UIBezierPath可以创建基于矢量的路径，此类是Core Graphics框架关于路径的封装。
 使用此类可以定义简单的形状，如椭圆、矩形或者有多个直线和曲线段组成的形状等。
 UIBezierPath是CGPathRef数据类型的封装。如果是基于矢量形状的路径，都用直线和曲线去创建。我们使用直线段去创建矩形和多边形，使用曲线去创建圆弧（arc）、圆或者其他复杂的曲线形状。
 使用UIBezierPath画图步骤：
 1.创建一个UIBezierPath对象
 2.调用-moveToPoint:设置初始线段的起点
 3.添加线或者曲线去定义一个或者多个子路径
 4.改变UIBezierPath对象跟绘图相关的属性。如，我们可以设置画笔的属性、填充样式等
 */
@property(nonatomic, strong)UIBezierPath *path;

@end

@implementation CustomPathView

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //touch
    UITouch *touch = [touches anyObject];
    //获得手指的触摸点
    CGPoint currentPoint = [touch locationInView:self];
    //创建路径
    UIBezierPath *path = [UIBezierPath bezierPath];
    //赋值全局
    self.path = path;
    //设置起点
    [path moveToPoint:currentPoint];
}
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //touch
    UITouch *touch = [touches anyObject];
    //获得手指的触摸点
    CGPoint currentPoint = [touch locationInView:self];
    //连线
    [self.path addLineToPoint:currentPoint];
    
    [self setNeedsDisplay];
}
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    /* 给imageView添加核心动画 */
    //添加核心动画
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    //键值路径
    keyAnima.keyPath = @"position";
    //设置路径
    keyAnima.path = _path.CGPath;
    //动画执行时长
    keyAnima.duration = 1;
    //重复次数
    keyAnima.repeatCount = MAXFLOAT;
    
    [[self.subviews.firstObject layer]addAnimation:keyAnima forKey:nil];
}

- (void)drawRect:(CGRect)rect
{
    //描边
    [self.path stroke];
}

@end
