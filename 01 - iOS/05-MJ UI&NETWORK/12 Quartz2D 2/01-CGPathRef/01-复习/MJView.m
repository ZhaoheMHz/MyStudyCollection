//
//  MJView.m
//  01-复习
//
//  Created by 赵赤赤 on 16/3/27.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJView.h"

@implementation MJView

// create\copy\retain都需要release
- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 1.先创建一个路径
    CGMutablePathRef path = CGPathCreateMutable();
    
    // 2.拼接路径
    CGPathMoveToPoint(path, NULL, 0, 0);
    CGPathAddLineToPoint(path, NULL, 100, 100);
    
    // 3.添加路径到上下文
    CGContextAddPath(ctx, path);
    
    // 4.渲染
    CGContextStrokePath(ctx);
    
    
    CGPathRelease(path);
}

@end
