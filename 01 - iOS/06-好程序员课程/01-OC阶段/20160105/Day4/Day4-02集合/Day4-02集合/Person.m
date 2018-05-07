//
//  Person.m
//  Day4-02集合
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

@implementation Person

+ (instancetype)personWithName:(NSString *)name age:(NSUInteger)age
{
    Person *person = [[self alloc] init];
    person.name = name;
    person.age = age;
    
    return person;
}

// 这个方法最后的比较结果，将作为数组排序的依据
- (NSComparisonResult)comparePerson:(Person *)person
{
    return [_name compare:person.name];
}

- (NSString *)description
{
    return
    [NSString stringWithFormat:
     @"name: %@, age: %lu", _name, _age];
}

@end








