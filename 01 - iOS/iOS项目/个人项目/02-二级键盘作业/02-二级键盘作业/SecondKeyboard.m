//
//  SecondKeyboard.m
//  02-二级键盘作业
//
//  Created by 赵赤赤 on 15/8/27.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "SecondKeyboard.h"

@implementation SecondKeyboard
{
    NSMutableArray *_emojiArray;
}

- (instancetype)init
{
    self = [super init];
    _emojiArray = [[NSMutableArray alloc] init];
    if (self) {
        self.bounds = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 30);
        [self addEmoji];
        [self createButton];
    }
    return self;
}

- (void)addEmoji
{
    [_emojiArray addObject:@"😉"];
    [_emojiArray addObject:@"😍"];
    [_emojiArray addObject:@"🐨"];
    [_emojiArray addObject:@"🐻"];
    [_emojiArray addObject:@"🔥"];
    [_emojiArray addObject:@"💩"];
    [_emojiArray addObject:@"💘"];
    [_emojiArray addObject:@"👿"];
    [_emojiArray addObject:@"👽"];
    [_emojiArray addObject:@"🎋"];
}

- (void)createButton
{
    int count = (int)_emojiArray.count;
    CGFloat buttonW = 30;
    CGFloat buttonH = 30;
    CGFloat margin = ([UIScreen mainScreen].bounds.size.width-count*buttonW)/(count+1);
    for (int i=0; i<count; i++) {
        UIButton *button = [[UIButton alloc] init];
        CGFloat buttonX = margin+i*(buttonW+margin);
        CGFloat buttonY = 0;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        [button setTitle:_emojiArray[i] forState:UIControlStateNormal];
        button.tag = i+1;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
}

- (void)buttonClick:(UIButton *)button
{
    if (_delegate && [_delegate respondsToSelector:@selector(keyView:enterS:)]) {
        [_delegate keyView:self enterS:_emojiArray[button.tag-1]];
    }
}

@end
