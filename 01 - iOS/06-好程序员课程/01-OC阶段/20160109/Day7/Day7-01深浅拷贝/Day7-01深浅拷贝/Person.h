//
//  Person.h
//  Day7-01深浅拷贝
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// 面试高频
// NSString 使用copy 是为了防止外界的改变对象本身的属性产生影响，从而造成不可预期的结果
@property (nonatomic, copy) NSString *name;

- (void)eat;
- (void)changeName;

@end








