//
//  QuickControl.m
//  FreeLimit1408
//
//  Created by mac on 14-5-16.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "QuickControl.h"

@implementation QuickControl
//快速创建 label
+(UILabel *)labelWithFrame:(CGRect)frame
                     title:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    return label;
}
//快速创建 imageView
+(UIImageView *)imageViewWithFrame:(CGRect)frame
                         imageFile:(NSString *)file
{
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.userInteractionEnabled = YES;
    imageView.image = [UIImage imageNamed:file];
    return imageView;
}
//快速创建 button
+(UIButton *)imageButtonWithFrame:(CGRect)frame
                            title:(NSString*)title
                        imageFile:(NSString *)file
                           target:(id)target
                           action:(SEL)action
                              tag:(int)tag
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    [button setTitle:title forState:UIControlStateNormal];
    [button setBackgroundImage:[UIImage imageNamed:file] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    button.tag = tag;
    return button;
}
@end
