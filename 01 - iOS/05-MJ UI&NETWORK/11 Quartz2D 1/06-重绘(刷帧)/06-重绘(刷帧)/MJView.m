//
//  MJView.m
//  06-重绘(刷帧)
//
//  Created by 赵赤赤 on 16/3/27.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJView.h"

@implementation MJView

- (void)drawRect:(CGRect)rect {
    NSLog(@"%f", self.radius);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddArc(ctx, 125, 125, self.radius, 0, M_PI*2, 0);
    CGContextFillPath(ctx);
}

@end
