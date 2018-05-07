//
//  SetTest.m
//  Day4-02集合
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "SetTest.h"

@implementation SetTest

// Set集合：用来存储一组无序，不重复的对象
+ (void)test
{
    NSSet *set =
    [NSSet setWithObjects:@"2", @"2", @"1", @"3", nil];
    
    NSArray *array =
  @[@"1", @"1", @"1", @"2", @"2"];
    
    // NSSet 给数组去重的方法
    array =
    [[NSSet setWithArray:array] allObjects];
    
    NSLog(@"%@", array);
    
    NSMutableSet *mutableSet = [NSMutableSet setWithObjects:@"1", @"2", @"3", nil];
    
    set = [NSSet setWithObjects:@"2", @"3", @"4", nil];
    
    [mutableSet intersectSet:set];
    NSLog(@"%@", mutableSet);
}



@end



