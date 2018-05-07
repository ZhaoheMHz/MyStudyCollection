//
//  Soldier.m
//  Day2-02new方法的实现原理
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "Soldier.h"

@implementation Soldier

+ (instancetype)new
{
    // 如果开发中，有些代码暂时不需要执行，可以使用#if 0 ... #endif 来进行代码注释
#if 0
    Soldier *soldier = [Soldier alloc];
    // init 叫做默认初始化（构造）方法
    soldier = [soldier init];
    
    return soldier;
#endif
    
    // OC中方法的连调，执行顺序是由内向外的
    // self 在类方法中，表示的就是当前类(当前类是指外部实际调用new方法的那个类)
    return [[self alloc] init];
}

- (void)setName:(NSString *)name
{
    _name = name;
}

- (NSString *)description
{
    return
    [NSString stringWithFormat:@"soldier: %@", _name];
}

@end



