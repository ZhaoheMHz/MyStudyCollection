//
//  ZHSemaphoreTool.h
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/17.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZHSemaphoreTool : NSObject


+ (instancetype)creatSemaphore:(long)semephoreCount;

- (void)signal;

- (void)wait;

@end
