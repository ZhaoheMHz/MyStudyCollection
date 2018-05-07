//
//  MJShapeView.m
//  01-基本图形绘制
//
//  Created by 赵赤赤 on 16/3/21.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJShapeView.h"

@implementation MJShapeView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
//    drawTriangle();
    draw4Rect();
}

// 画四边形
void draw4Rect() {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画矩形
    CGContextAddRect(ctx, CGRectMake(10, 10, 100, 100));

    // 设置填充颜色
//    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    // 也可以通过UIColor设置颜色
//    [[UIColor blueColor] setFill];
    // 通用颜色，stroke和fill都是蓝色
    [[UIColor blueColor] set];
    
    CGContextFillPath(ctx);
}

// 画三角形
void drawTriangle() {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 画三角形
    CGContextMoveToPoint(ctx, 0, 0);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 150, 80);
    
    // 关闭路径（连接起点和终点）
    CGContextClosePath(ctx);
    
    // 设置空心颜色
    CGContextSetRGBStrokeColor(ctx, 0, 1, 0, 1);
    
    // 绘制图形
    CGContextFillPath(ctx);
}

@end
