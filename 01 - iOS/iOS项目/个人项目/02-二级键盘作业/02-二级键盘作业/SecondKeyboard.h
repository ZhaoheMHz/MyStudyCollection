//
//  SecondKeyboard.h
//  02-二级键盘作业
//
//  Created by 赵赤赤 on 15/8/27.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SecondKeyboard;


@protocol SecondKeyboardDelegate <NSObject>

- (void)keyView:(SecondKeyboard *)secondKeyboard enterS:(NSString *)string;

@end

@interface SecondKeyboard : UIView 

@property (nonatomic, assign) id<SecondKeyboardDelegate> delegate;

@end
