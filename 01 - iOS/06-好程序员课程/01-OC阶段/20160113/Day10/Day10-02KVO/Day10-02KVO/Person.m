//
//  Person.m
//  Day10-02KVO
//
//  Created by ZhangChao on 16/1/13.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

@implementation Person
{
    NSString *_sex;
}

// 允不允许KVC直接访问实例变量
+ (BOOL)accessInstanceVariablesDirectly
{
    return NO;
}

- (instancetype)initWithName:(NSString *)name car:(Car *)car
{
    self = [super init];
    
    if (self) {
        // 可以替换成 self.name
        _name = [name copy];
        _car = car;
    }
    
    return self;
}

// 2.当观察的属性发生值得变化时，就会回调该方法
// 这个方法要写在观察者所在的类中
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"keyPath: %@", keyPath);
    // object 监听的对象
    NSLog(@"object: %@", object);
    // change 值的变化情况
    NSLog(@"change: %@", change);
}

@end
