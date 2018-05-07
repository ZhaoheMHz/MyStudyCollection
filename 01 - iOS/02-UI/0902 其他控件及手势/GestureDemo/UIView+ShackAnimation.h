//
//  UIView+ShackAnimation.h
//  GesturesDemo
//
//  Created by 夏婷 on 15/9/2.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ShackAnimation)
- (void)shakeWithRaid:(CGFloat)raid duration:(NSTimeInterval)durtation repeatCount:(NSUInteger)count;
- (void)stopShake;
@end
