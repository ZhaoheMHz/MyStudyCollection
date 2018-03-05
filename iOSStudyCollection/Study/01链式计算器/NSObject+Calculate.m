//
//  NSObject+Calculate.m
//  CacuDemoWithMasonryModel
//
//  Created by 赵赫 on 2018/3/1.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "NSObject+Calculate.h"

@implementation NSObject (Calculate)

+ (float)makeCalculate:(void (^)(CalculateManager *))block {
    CalculateManager *manager = [[CalculateManager alloc] init];
    block(manager);
    return manager.result;
}

@end
