//
//  MHzLayer.m
//  04-CALayer04-自定义图层
//
//  Created by 赵赤赤 on 15/11/13.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "MHzLayer.h"

@implementation MHzLayer

// 图层上下文，参数直接为上下文，可以直接使用
- (void)drawInContext:(CGContextRef)ctx {
    // 设置颜色
    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1.0);
    
    // 画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 50, 50));
    
    // 设置渲染
    CGContextFillPath(ctx);
}

@end
