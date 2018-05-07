//
//  MJView.m
//  04-矩阵操作
//
//  Created by 赵赤赤 on 16/3/23.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJView.h"

@implementation MJView

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    // 上下文栈
    CGContextSaveGState(ctx);
    
    
    // 矩阵操作
    CGContextRotateCTM(ctx, M_PI_4*0.2);        // 旋转
    CGContextScaleCTM(ctx, 0.5, 0.5);           // 缩放
    CGContextTranslateCTM(ctx, 0, 50);          // 位移
    
    
    
    CGContextAddRect(ctx, CGRectMake(10, 10, 50, 50));
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 100, 100));
    CGContextStrokePath(ctx);

    // 上下文栈
    CGContextRestoreGState(ctx);
    CGContextMoveToPoint(ctx, 100, 100);
    CGContextAddLineToPoint(ctx, 200, 250);
    
    
    // 矩阵操作
    CGContextScaleCTM(ctx, 0.5, 0.5);       // 线会变细
    
    
    CGContextStrokePath(ctx);
}

@end
