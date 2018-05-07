//
//  Mother.h
//  Day5-02目标动作机制
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mother : NSObject

// 任何类的对象都可以作为target
@property id target;
@property SEL action;

- (void)addTarget:(id)target action:(SEL)action;
- (void)goOutside;

@end



