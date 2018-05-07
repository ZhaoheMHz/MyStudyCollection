//
//  GPMyWindow.m
//  01-事件传递
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPMyWindow.h"

@implementation GPMyWindow

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}


@end
