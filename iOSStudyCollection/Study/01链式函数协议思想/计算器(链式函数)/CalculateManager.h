//
//  CalculateManager.h
//  CacuDemoWithMasonryModel
//
//  Created by 赵赫 on 2018/3/1.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculateManager : NSObject

@property (nonatomic, assign) float result;

// 这里block的解释：
- (CalculateManager *(^)(float num))add;

- (CalculateManager *(^)(float num))sub;

- (CalculateManager *(^)(float num))multiple;

- (CalculateManager *(^)(float num))divide;

@end
