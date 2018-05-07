//
//  Person.h
//  Day6-01手动内存管理
//
//  Created by ZhangChao on 16/1/8.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

// 属性约束
// 1.线程安全相关（原子性）
//  》atomic（原子操作）(默认)
//  》nonatomic (非原子操作)
//  一般情况下，都使用nonatomic，可以提高程序的执行效率
// 2.内存管理相关
//  》MRC下，retain（强引用），copy（强引用），assign（弱引用，赋值，默认）
//  》ARC下，strong（强引用），weak（弱引用）
// 3.读写属性相关
//  》readwrite (同时生成 setter 和 getter 方法)(默认)
//  》readonly (只会生成getter 方法)
// 4.重命名相关
//  》setter方法重命名 方法名称后必须附带一个:
//  》getter方法重命名

@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) NSUInteger age;

// setSex:         sex
// setPersonSex:   personSex
@property
(nonatomic, retain, setter=setPersonSex:, getter=personSex)
NSString *sex;

+ (instancetype)person;
- (void)work;

@end







