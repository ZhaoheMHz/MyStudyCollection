//
//  NSObject+Calculate.h
//  CacuDemoWithMasonryModel
//
//  Created by 赵赫 on 2018/3/1.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CalculateManager.h"

@interface NSObject (Calculate)

+ (float)makeCalculate:(void (^)(CalculateManager *))CalculateManager;

@end
