//
//  KeyboardView.m
//  UITextField_baseMethod
//
//  Created by 赵赤赤 on 15/8/27.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "KeyboardView.h"

@implementation KeyboardView
{
    NSMutableArray *_titlesArray;
}

- (instancetype)init
{
    self = [super init];
    _titlesArray = [[NSMutableArray alloc] init];
    self.bounds = CGRectMake(0, 0, 480, 200);
    if (self) {
        for (int i = 'A'; i<='z'; i++) {
            NSString *str = [NSString stringWithFormat:@"%c", i];
            [_titlesArray addObject:str];
        }
        
        [self createButtons];
    }
    return self;
}

- (void)createButtons
{
    int index = 0;
    for (int i=0; i<5; i++) {
        for (int j= 0; j<5; j++) {
            UIButton *button = [[UIButton alloc] init];
            button.backgroundColor = [UIColor redColor];
            button.frame = CGRectMake(20+j*40, 10+i*40, 30, 30);
            button.tag = index;
            [button setTitle:_titlesArray[index] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
            
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [self addSubview:button];
            index ++;
        }
    }
}

- (void)buttonClick:(UIButton *)button
{
    if (_delegate && [_delegate respondsToSelector:@selector(keyView:enterS:)]) {
        [_delegate keyView:self enterS:_titlesArray[button.tag]];
    }
}

@end
