//
//  ViewController.m
//  04-CALayer04-自定义图层
//
//  Created by 赵赤赤 on 15/11/13.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "MHzLayer.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self diylayer2];
}


- (void)diylayer2 {
    // layer的代理不需要遵守协议，因为他的代理是基于NSObject
    
    CALayer *layer = [[CALayer alloc] init];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.anchorPoint = CGPointZero;
    layer.delegate = self;
    [layer setNeedsDisplay];
    [self.view.layer addSublayer:layer];
}

#pragma mark - 图层的代理方法
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx {
    // 设置颜色
    CGContextSetRGBFillColor(ctx, 1.0, 0, 0, 1.0);
    
    // 画圆
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 50, 50));
    
    // 设置渲染
    CGContextFillPath(ctx);
}

- (void)diyLayer1 {
    MHzLayer *layer = [[MHzLayer alloc] init];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.backgroundColor = [UIColor blueColor].CGColor;
    layer.anchorPoint = CGPointZero;
    [layer setNeedsDisplay];        // layer不同于view，需要明确的去调用setNeedDisplay才能去调用drawRect进行绘制
    [self.view.layer addSublayer:layer];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSaveGState(ctx);
    
    CGContextRestoreGState(ctx);
}

@end
