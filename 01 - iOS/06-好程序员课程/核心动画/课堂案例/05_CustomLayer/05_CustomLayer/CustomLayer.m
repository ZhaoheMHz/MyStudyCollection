//
//  CustomLayer.m
//  05_CustomLayer
//
//  Created by baoxu on 16/3/9.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "CustomLayer.h"

@implementation CustomLayer
/**
 *  想要像UIView上绘图，重写drawRect方法；
    想要像CALayer上绘图，需要重写drawInContext方法
    如果设置了代理方法，代理也能实现相应的功能，如果都写了，会以下面的这个方法优先，不再调用代理方法
 */
//-(void)drawInContext:(CGContextRef)ctx{
//    CGContextAddRect(ctx, CGRectMake(100, 100, 100, 100));
//    CGContextFillPath(ctx);
//}

@end
