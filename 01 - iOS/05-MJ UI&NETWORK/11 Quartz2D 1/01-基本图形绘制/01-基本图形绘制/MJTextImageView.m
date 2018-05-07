//
//  MJTextImageView.m
//  01-基本图形绘制
//
//  Created by 赵赤赤 on 16/3/21.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "MJTextImageView.h"

@implementation MJTextImageView

- (void)drawRect:(CGRect)rect {
//    drawText();
    drawImage();
}

// 画图片
void drawImage() {
    // 获取图片
    UIImage *image = [UIImage imageNamed:@"me"];
//    [image drawAtPoint:CGPointMake(50, 50)];
//    [image drawInRect:CGRectMake(50, 50, 100, 100)];
    [image drawAsPatternInRect:CGRectMake(0, 0, 200, 200)];
}

// 画文字
void drawText() {
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextAddRect(ctx, CGRectMake(50, 50, 100, 100));
    CGContextStrokePath(ctx);
    
    
    
    // 文字
    NSString *str = @"啊哈哈哈 Good Morning";
    
    // OC方法不需要上下文，默认封装了
//    [str drawAtPoint:CGPointZero withAttributes:nil];
    NSMutableDictionary *attrs = [[NSMutableDictionary alloc] init];
    attrs[NSForegroundColorAttributeName] = [UIColor redColor];
    [str drawInRect:CGRectMake(50, 50, 100, 100) withAttributes:attrs];
}

@end
