//
//  QFFraction.m
//  分数练习
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "QFFraction.h"

@implementation QFFraction

- (instancetype)initWithNumerator:(int)numerator denominator:(int)denominator
{
    self = [super init];
    
    if (self) {
        _numerator = numerator;
        _denominator = denominator;
    }
    
    return self;
}

- (void)addFraction:(QFFraction *)fraction2
{
    int newNumerator = 0;
    int newDenominator = 0;
    
    newDenominator = _denominator * fraction2.denominator;
    newNumerator = _denominator * fraction2.numerator + fraction2.denominator * _numerator;
    
    _numerator = newNumerator;
    _denominator = newDenominator;
    
    [self reductionOfFraction];
}

// 15 / 20 --> 3 / 4
- (void)reductionOfFraction
{
    int min =
    (_denominator > _numerator) ? _numerator : _denominator;
    
    for (int i = min; i > 1; i--) {
        if (_denominator % i == 0 &&
            _numerator % i == 0) {
            _denominator /= i;
            _numerator /= i;
            
            NSLog(@"%d/%d",
                  _numerator, _denominator);
            break;
        }
    }
}

@end
