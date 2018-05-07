//
//  Train.h
//  Day8-Block中的循环引用
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Train : NSObject

// 通过属性完成block赋值
@property (nonatomic, copy) void (^block)();
@property (nonatomic, copy) NSString *name;

// 1.通过参数传递进行block的赋值
// 2.调用Block
- (void)readyForRunningWithBlock:(void (^)())block;
- (void)startup;
- (void)run;

@end




