//
//  DynamicView.h
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DynamicView : UIView
//仿真者（盒子）
@property (strong, nonatomic) UIImageView *box;
//仿真环境/器（操场）
@property (strong, nonatomic) UIDynamicAnimator *animator;

@end
