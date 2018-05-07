//
//  Gun.m
//  Day2-01对象组合
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "Gun.h"
#import "Soldier.h"

@implementation Gun

- (void)setType:(NSString *)type
{
    _type = type;
}

- (void)setBulletCount:(NSUInteger)bulletCount
{
    _bulletCount = bulletCount;
}

- (void)setHolder:(Soldier *)holder
{
    _holder = holder;
}

- (NSString *)type
{
    return _type;
}

- (NSUInteger)bulletCount
{
    return _bulletCount;
}

- (void)fire
{
    if (_bulletCount == 0) {
        NSLog(@"子弹用光了");
        [_holder reload];
        
        return;
    }
    
    // --在前面，就是先减，在做其他操作
    // --在后面，就是先做操作，在进行减法运算
    NSLog(@"%@发射了一发子弹, 还剩%lu发",
          _type, --_bulletCount);
}

@end







