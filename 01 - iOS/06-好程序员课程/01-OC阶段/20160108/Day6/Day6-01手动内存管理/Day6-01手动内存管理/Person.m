//
//  Person.m
//  Day6-01手动内存管理
//
//  Created by ZhangChao on 16/1/8.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

@implementation Person

// 对象销毁时调用，不要手动调用该方法
// 销毁对象只会回收该对象的内存，如果类中还有其他对象，在MRC下还需要手动进行释放
- (void)dealloc
{
    // 对象销毁前，需要进行的一些操作，都可以写在这里
    NSLog(@"person<%p>被销毁", self);
    
    // [super dealloc] 一定要放在最下面
    [super dealloc];
}

- (void)work
{
    NSLog(@"work");
}

+ (instancetype)person
{
    // person 在哪里释放？
    // 迫不得已的情况就要使用autorelease
    // 在自动释放池结束后对象会被autorelease
    // 使用autorelease之后，对象不会立即被释放
    Person *person =
    [[[self alloc] init] autorelease];
    
    return person;
}

@end





