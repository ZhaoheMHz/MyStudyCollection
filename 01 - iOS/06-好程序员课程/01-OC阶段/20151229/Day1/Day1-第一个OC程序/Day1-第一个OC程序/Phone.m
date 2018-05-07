//
//  Phone.m
//  Day1-第一个OC程序
//
//  Created by ZhangChao on 15/12/29.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "Phone.h"

@implementation Phone

- (void)about
{
    NSString *color = nil;
    
    if (_color == PCWhite) {
        color = @"白色";
    }
    else if (_color == PCBlack) {
        color = @"黑色";
    }
    else {
        color = @"土豪金";
    }
    
    NSLog(@"手机参数：尺寸：%.1f, 内存: %.1fM, 机身颜色: %@", _size, _memory, color);
}

- (void)makeCallTo:(NSString *)receiver
{
    NSLog(@"给%@打电话", receiver);
}

- (void)sendMessage:(NSString *)message toReceiver:(NSString *)receiver
{
    NSLog(@"\n收件人：%@\n------\n%@\n-----",
          receiver, message);
}

- (void)playGame
{
    NSLog(@"斗地主");
}

// 通过重写父类的方法，完成不同的逻辑
- (NSString *)description
{
    return [NSString stringWithFormat:
            @"尺寸：%.1f，内存: %.1f",
            _size, _memory];
}

+ (int)calculateA:(int)a andB:(int)b withSymbol:(char)symbol
{
    switch (symbol) {
        case '+':
            return a + b;
        case '-':
            return a - b;
        case '*':
            return a * b;
        case '/':
            return a / b;
            
        default:
            return 0;
    }
}

@end






