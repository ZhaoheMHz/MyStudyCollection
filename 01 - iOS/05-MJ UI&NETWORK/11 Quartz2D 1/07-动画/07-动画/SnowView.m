//
//  SnowView.m
//  07-动画
//
//  Created by 赵赤赤 on 16/3/27.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "SnowView.h"

@interface SnowView ()

@property (nonatomic, assign) CGFloat snowY;

@end

@implementation SnowView

- (void)awakeFromNib {
    // 1秒60次的刷新
    CADisplayLink *link = [CADisplayLink displayLinkWithTarget:self selector:@selector(setNeedsDisplay)];
    [link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(setNeedsDisplay) userInfo:nil repeats:YES];
}

- (void)drawRect:(CGRect)rect {
    self.snowY += 10;
    
    if (self.snowY >= rect.size.height) {
        self.snowY = 0;
    }
    
    UIImage *image = [UIImage imageNamed:@"snow"];
    [image drawAtPoint:CGPointMake(0, self.snowY)];
}

@end
