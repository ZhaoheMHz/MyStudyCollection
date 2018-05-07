//
//  Mother.h
//  Day5-03Block
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

// block的声明 和 调用是写在主动方所在的类
@interface Mother : NSObject

// block 属性的写法
// @property (nonatomic, copy) 返回值类型 (^Block名称)(形参表);
@property NSString *name;
@property (nonatomic, copy) void (^actionBlock)();

// block 作为方法形参的写法
// 方法名:(block类型)block名称
- (void)goOutsideWithAction:(void (^)())action;

@end








