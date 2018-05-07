//
//  BezierPathView.m
//  UIBezierPath
//
//  Created by 赵赤赤 on 16/3/18.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "BezierPathView.h"

@implementation BezierPathView

- (void)drawRect:(CGRect)rect {
    // 先将view填充满白色，否则背景是黑色的
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    
//    [self drawTrianglePath];
    [self drawRectPath];
}

/** 画三角 */
- (void)drawTrianglePath {
    UIBezierPath *path = [[UIBezierPath alloc] init];
    // 指定path的起始点
    [path moveToPoint:CGPointMake(20, 20)];
    // 添加一系列的线
    [path addLineToPoint:CGPointMake(self.frame.size.width - 40, 20)];
    [path addLineToPoint:CGPointMake(self.frame.size.width / 2, self.frame.size.height - 20)];
    // 将线闭合
    [path closePath];
    
    // 设置线的宽度
    path.lineWidth = 1.5;
    
    // 设置填充色
    UIColor *fillColor = [UIColor greenColor];
    [fillColor set];
    [path fill];
    
    // 设置画线色
    UIColor *strokeColor = [UIColor blueColor];
    [strokeColor set];
    [path stroke];
}


/** 画矩形 */
- (void)drawRectPath {
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(20, 20, self.frame.size.width-40, self.frame.size.height-40)];
    path.lineWidth = 1.5;
    path.lineJoinStyle = kCGLineJoinBevel;
    
    //    kCGLineJoinMiter,
//    kCGLineJoinRound,
//    kCGLineJoinBevel
    
    [[UIColor greenColor] set];
    [path fill];
    
    [[UIColor blueColor] set];
    [path stroke];
}

@end
