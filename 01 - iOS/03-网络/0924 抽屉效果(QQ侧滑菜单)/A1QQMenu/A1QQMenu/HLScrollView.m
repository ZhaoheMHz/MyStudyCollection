//
//  HLScrollView.m
//  A1QQMenu
//
//  Created by 赵赤赤 on 15/9/24.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "HLScrollView.h"

@implementation HLScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentSize = CGSizeMake((1+K_SCALE)*K_WIDTH, 0);
        self.pagingEnabled = YES;
        self.bounces = NO;
        self.showsHorizontalScrollIndicator = NO;
        
        // 将ScrollView设置为默认菜单打开状态
        self.contentOffset = CGPointMake(K_SCALE * K_WIDTH, 0);
    }
    return self;
}

// 设置ScrollView的滑动条件
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognize {
    // 拿到手指触摸在scrollView上的坐标
    CGPoint point = [gestureRecognize locationInView:self];
    
    // 菜单打开时
    if (!self.contentOffset.x) {
        if (point.x > K_SCALE * K_WIDTH) {
            return YES;
        }
    }
    else if (point.x < 50 + K_SCALE * K_WIDTH){
        if (point.y < 64) {
            return NO;
        }
        
        return YES;
    }
    
    return NO;
}

@end
