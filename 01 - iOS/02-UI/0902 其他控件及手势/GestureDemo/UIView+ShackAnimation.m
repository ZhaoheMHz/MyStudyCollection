//
//  UIView+ShackAnimation.m
//  GesturesDemo
//
//  Created by 夏婷 on 15/9/2.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "UIView+ShackAnimation.h"

@implementation UIView (ShackAnimation)

//启动摇动动画
- (void)shakeWithRaid:(CGFloat)raid duration:(NSTimeInterval)durtation repeatCount:(NSUInteger)count
{
    //添加摇动动画
    CABasicAnimation * shakeAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //创建一个动画，修改旋转
    
    //设置时间
    shakeAnimation.duration = durtation;
    
    //设置摇摆幅度 NSNumber
    shakeAnimation.fromValue = [NSNumber numberWithFloat:-raid];
    shakeAnimation.toValue = [NSNumber numberWithFloat:raid];
    
    //设置自动倒带
    shakeAnimation.autoreverses = YES;
    
    //设置完成后自动移除动画
    shakeAnimation.removedOnCompletion = YES;
    
    //设置摇摆次数
    if (count != 0)
        shakeAnimation.repeatCount = count;
    else
        shakeAnimation.repeatCount = FLT_MAX;
    
    
    //添加给视图 layer用于设置动画，修改视图圆角等。
    [self.layer addAnimation:shakeAnimation forKey:@"Let me shake"];
    //添加后自然启动
}

//停止摇动
- (void)stopShake
{
    //删除动画，动画停止
    [self.layer removeAnimationForKey:@"Let me shake"];
}
@end
