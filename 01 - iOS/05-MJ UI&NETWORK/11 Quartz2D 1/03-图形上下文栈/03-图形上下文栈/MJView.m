//
//  MJView.m
//  03-图形上下文栈
//
//  Created by 赵赤赤 on 16/3/22.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJView.h"

@implementation MJView

- (void)drawRect:(CGRect)rect {
    // 1.获取上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    
    
    // 存储当然上下文到图形上下文栈中
    CGContextSaveGState(ctx);
    
    
    
    
    
    // 设置绘图状态
    CGContextSetLineWidth(ctx, 10);
    [[UIColor redColor] set];
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 第1根线
    CGContextMoveToPoint(ctx, 50, 50);
    CGContextAddLineToPoint(ctx, 120, 190);
    CGContextStrokePath(ctx);
    
    
    
    
    
    // 取出存储在栈中的上下文
    CGContextRestoreGState(ctx);
    
    
    
    
    
    
    
    // 第2根线
    CGContextMoveToPoint(ctx, 200, 70);
    CGContextAddLineToPoint(ctx, 220, 290);
    
    CGContextStrokePath(ctx);
}

@end
