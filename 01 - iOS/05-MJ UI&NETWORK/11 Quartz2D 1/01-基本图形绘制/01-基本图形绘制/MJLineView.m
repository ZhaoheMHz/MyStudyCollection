//
//  MJView.m
//  01-基本图形绘制
//
//  Created by 赵赤赤 on 16/3/21.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJLineView.h"

@implementation MJLineView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // 1.获得图形上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 2.拼接图形
    
    // 设置线的宽度
    CGContextSetLineWidth(ctx, 10);
    
    // 设置线段的头尾部样式
    CGContextSetLineCap(ctx, kCGLineCapRound);
    
    // 设置转折点的样式
    CGContextSetLineJoin(ctx, kCGLineJoinRound);
    
    
    
    /** 第1个线段 */
    // 设置颜色
    CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 1);
    
    // 设置一个起点
    CGContextMoveToPoint(ctx, 10, 10);
    
    // 添加一条线
    CGContextAddLineToPoint(ctx, 100, 100);
    
    // 渲染一次
    CGContextStrokePath(ctx);
    
    
    /** 第2个线段 */
    // 设置颜色
    CGContextSetRGBStrokeColor(ctx, 0, 0, 1, 1);
    
    // 再设置一个气点
    CGContextMoveToPoint(ctx, 200, 190);
    
    // 再添加一条
    CGContextAddLineToPoint(ctx, 150, 40);
    
    // 再转折一次
    CGContextAddLineToPoint(ctx, 120, 60);

    // 3.渲染显示到view上面
    CGContextStrokePath(ctx);
}

@end
