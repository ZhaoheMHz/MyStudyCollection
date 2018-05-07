//
//  MJHumanView.m
//  02-小黄人
//
//  Created by 赵赤赤 on 16/3/22.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJHumanView.h"
#define MJColor(r,g,b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]

@implementation MJHumanView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 1.身体
    // 上半圆
    CGFloat topX = rect.size.width*0.5;
    CGFloat topY = 200;
    CGFloat topRadius = 100;
    CGContextAddArc(ctx, topX, topY, topRadius, 0, M_PI, 1);
    
    // 向下延伸
    CGFloat middleX = topX-topRadius;
    CGFloat middleH = 150;
    CGFloat middleY = topY+middleH;
    CGContextAddLineToPoint(ctx, middleX, middleY);
    
    // 下半圆
    CGFloat bottomX = topX;
    CGFloat bottomY = middleY;
    CGFloat bottomRadius = topRadius;
    CGContextAddArc(ctx, bottomX, bottomY, bottomRadius, M_PI, 0, 1);
    
    // 合并路径
    CGContextClosePath(ctx);
    
    [MJColor(251, 218, 0) setFill];
    
    CGContextFillPath(ctx);
    
    
    
    
    // 2.嘴
    // 中间的控制点
    CGFloat controlX = rect.size.width * 0.5;
    CGFloat controlY = rect.size.height * 0.5;
    
    // 当前点
    CGFloat marginX = 30;
    CGFloat marginY = 15;
    CGFloat currentX = controlX - marginX;
    CGFloat currentY = controlY - marginY;
    CGContextMoveToPoint(ctx, currentX, currentY);
    
    // 结束点
    CGFloat endX = controlX + marginX;
    CGFloat endY = controlY - marginY;
    
    // 贝赛尔曲线
    CGContextAddQuadCurveToPoint(ctx, controlX, controlY, endX, endY);
    
    CGContextStrokePath(ctx);
    
    
    
    
    // 3.眼睛
    // 黑色绑带
    CGContextAddRect(ctx, CGRectMake(middleX, topY, topRadius*2, 30));
    [[UIColor blackColor] setFill];
    CGContextFillPath(ctx);
    
    // 最外圈的镜框
    CGContextAddArc(ctx, topX, topY+15, topRadius*0.4, 0, M_PI*2, 0);
    [MJColor(61, 62, 66) setFill];
    CGContextFillPath(ctx);
    
    // 里面的白色
    CGContextAddArc(ctx, topX, topY+15, topRadius* 0.4 * 0.7, 0, M_PI*2, 0);
    [[UIColor whiteColor] setFill];
    CGContextFillPath(ctx);
    
    // 里面的白色
    CGContextAddArc(ctx, topX, topY+15, topRadius* 0.4 * 0.7*0.6, 0, M_PI*2, 0);
    [MJColor(76, 28, 25) setFill];
    CGContextFillPath(ctx);
    
    // 里面的白色
    CGContextAddArc(ctx, topX, topY+15, topRadius* 0.4 * 0.7*0.6*0.4, 0, M_PI*2, 0);
    [[UIColor blackColor] setFill];
    CGContextFillPath(ctx);
    
    // 里面的白色
    CGContextAddArc(ctx, topX+topRadius* 0.4 * 0.7*0.6*0.3, topY+15-(topRadius* 0.4 * 0.7*0.6*0.3), topRadius* 0.4 * 0.7*0.6*0.3, 0, M_PI*2, 0);
    [[UIColor whiteColor] setFill];
    CGContextFillPath(ctx);
}

@end
