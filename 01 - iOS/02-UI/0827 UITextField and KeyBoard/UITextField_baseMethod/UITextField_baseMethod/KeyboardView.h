//
//  KeyboardView.h
//  UITextField_baseMethod
//
//  Created by 赵赤赤 on 15/8/27.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <UIKit/UIKit.h>
@class KeyboardView;

@protocol KeyboardViewDelegate <NSObject>

- (void)keyView:(KeyboardView *)KeyboardView enterS:(NSString *)string;

@end

@interface KeyboardView : UIView

@property (nonatomic, assign) id<KeyboardViewDelegate> delegate;

@end
