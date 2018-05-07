//
//  QFFraction.h
//  分数练习
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QFFraction : NSObject

@property int numerator; //分子
@property int denominator; // 分母

- (instancetype)initWithNumerator:(int)numerator
                      denominator:(int)denominator;

- (void)addFraction:(QFFraction *)fraction2;
- (void)subFraction:(QFFraction *)fraction2;
- (void)mulFraction:(QFFraction *)fraction2;
- (void)divFraction:(QFFraction *)fraction2;

// 约分
- (void)reductionOfFraction;

@end
