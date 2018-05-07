//
//  MJClipView.m
//  05-裁剪
//
//  Created by 赵赤赤 on 16/3/27.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJClipView.h"

@implementation MJClipView

- (void)drawRect:(CGRect)rect {
    // 0.画圆
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddEllipseInRect(ctx, CGRectMake(100, 100, 50, 50));
    
    // 裁剪
    CGContextClip(ctx);
    
    CGContextFillPath(ctx);
    
    // 1.显示图片
    UIImage *image = [UIImage imageNamed:@"me"];
    [image drawAtPoint:CGPointMake(100, 100)];
}

@end
