//
//  HLScrollView.h
//  A1QQMenu
//
//  Created by 赵赤赤 on 15/9/24.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <UIKit/UIKit.h>

// RootView的缩放倍数
#define K_SCALE 0.8

// 屏幕的大小
#define K_WIDTH [UIScreen mainScreen].bounds.size.width
#define K_HEIGHT [UIScreen mainScreen].bounds.size.height

// 视图缩小后的Y坐标
#define K_YPOINT (K_HEIGHT * (1- K_SCALE) / 2)

@interface HLScrollView : UIScrollView

@end
