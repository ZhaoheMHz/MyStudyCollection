//
//  Person.h
//  Day4-02集合
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property NSString *name;
@property NSUInteger age;

+ (instancetype)personWithName:(NSString *)name age:(NSUInteger)age;

- (NSComparisonResult)comparePerson:(Person *)person;

@end






