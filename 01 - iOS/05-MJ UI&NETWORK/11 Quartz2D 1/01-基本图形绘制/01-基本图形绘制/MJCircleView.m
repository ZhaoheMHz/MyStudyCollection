
//
//  MJCircleView.m
//  01-基本图形绘制
//
//  Created by 赵赤赤 on 16/3/21.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJCircleView.h"

@implementation MJCircleView

// 在view第一次显示在屏幕上的时候调用一次
- (void)drawRect:(CGRect)rect {
//    drawCircle();
    drawYuanHu();
//    draw41Circle();
}

void drawYuanHu() {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 添加圆弧
    // x/y圆心
    // clockwise顺时针还是逆时针0顺时针，1逆时针
    CGContextAddArc(ctx, 100, 100, 50, 0, M_PI_2, 0);
    
    CGContextStrokePath(ctx);
}

// 画四分之一圆
void draw41Circle() {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 100, 150);
    CGContextAddArc(ctx, 100, 100, 50, M_PI_2, M_PI, 0);
    CGContextClosePath(ctx);
    [[UIColor redColor] set];
    
    CGContextFillPath(ctx);
}

void drawCircle() {
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.添加一个椭圆
    CGContextAddEllipseInRect(ctx, CGRectMake(10, 10, 100, 100));
    
    // 3.显示绘制内容
    CGContextFillPath(ctx);
}

@end
