//
//  QuickControl.h
//  FreeLimit1408
//
//  Created by mac on 14-5-16.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuickControl : NSObject
//快速创建 label
+(UILabel *)labelWithFrame:(CGRect)frame
                     title:(NSString *)title;
//快速创建 imageView
+(UIImageView *)imageViewWithFrame:(CGRect)frame
                         imageFile:(NSString *)file;
//快速创建 button
+(UIButton *)imageButtonWithFrame:(CGRect)frame
                            title:(NSString*)title
                         imageFile:(NSString *)file
                           target:(id)target
                           action:(SEL)action
                              tag:(int)tag;


@end
