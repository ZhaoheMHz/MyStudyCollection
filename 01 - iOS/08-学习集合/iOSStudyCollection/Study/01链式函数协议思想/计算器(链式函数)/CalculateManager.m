//
//  CalculateManager.m
//  CacuDemoWithMasonryModel
//
//  Created by 赵赫 on 2018/3/1.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "CalculateManager.h"

@implementation CalculateManager

- (CalculateManager *(^)(float num))add {
    return ^(float num) {
        _result += num;
        return self;
    };
}

- (CalculateManager *(^)(float num))sub {
    return ^(float num) {
        _result -= num;
        return self;
    };
}

- (CalculateManager *(^)(float num))multiple {
    return ^(float num) {
        _result *= num;
        return self;
    };

}

- (CalculateManager *(^)(float num))divide {
    return ^(float num) {
        _result /= num;
        return self;
    };

}

@end
