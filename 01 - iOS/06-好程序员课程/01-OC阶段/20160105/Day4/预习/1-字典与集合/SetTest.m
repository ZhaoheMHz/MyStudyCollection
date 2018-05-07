//
//  SetTest.m
//  1-字典与集合
//
//  Created by ZhangChao on 15/11/20.
//  Copyright (c) 2015年 Chao. All rights reserved.
//

#import "SetTest.h"

@implementation SetTest

+ (void)test
{
    [self createSet];
    [self createMutableSet];
}

/** 创建不可变集合 */
+ (void)createSet
{
    NSSet *set = [NSSet setWithObjects:@"one", @"two", @"three", @[@"1", @"2", @"3"], nil];
    set = [NSSet setWithObjects:@"1", @1, @"2", @"3", set, nil]; // 各不相同指的是对象，是建立在同一对象类型下的
    
    // 获取集合的元素数量
    NSUInteger setCount = [set count]; // set.count <==> [set count] 点语法就是在调用set、get方法
    // 获取所有元素
    NSArray *allObjects = [set allObjects];
    
    
    NSLog(@"set: %@", set);
    NSLog(@"set count: %lu", setCount);
    NSLog(@"set all objects: %@", allObjects);
    
    // 判断集合是否包含某对象
    if ([set containsObject:@"2"]) {
        NSLog(@"YES");
    }
    
    // 循环遍历集合
    for (id object in set) {
        NSLog(@"%@", object);
    }
    
    NSEnumerator *enumerator = [set objectEnumerator];
    id value = nil;
    while (value = [enumerator nextObject]) {
        NSLog(@"value: %@",value);
    }
}

/** 创建可变集合 */
+ (void)createMutableSet
{
    NSMutableSet * mutableSet = [NSMutableSet set];
    [mutableSet addObject:@"xiaozhe"];
    [mutableSet addObject:@"xiaozhe"];
    
    [mutableSet removeObject:@"xiaozhe"];
    //删除所有的数据
    [mutableSet removeAllObjects];
    
    NSLog(@"%@",mutableSet);
    
    //可以通过把数组转换成集合的方式,来过滤掉数组中存储的重复元素
    NSArray * tmp = @[@"xiaozhe",@"xiaozhe",@"1",@"1"];
    
    [mutableSet addObjectsFromArray:tmp];
    
    NSLog(@"%@",mutableSet);
}

@end
