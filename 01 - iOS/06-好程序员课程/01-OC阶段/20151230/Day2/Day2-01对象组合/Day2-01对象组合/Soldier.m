//
//  Soldier.m
//  Day2-01对象组合
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "Soldier.h"

@implementation Soldier

#pragma mark - set方法 -

- (void)setName:(NSString *)name
{
    _name = name;
}

- (void)setHealthPoint:(NSUInteger)healthPoint
{
    _healthPoint = healthPoint;
}

- (void)setGun:(Gun *)gun
{
    _gun = gun;
}

#pragma mark - get方法 -

- (NSString *)name
{
    return _name;
}

- (NSUInteger)healthPoint
{
    return _healthPoint;
}

- (Gun *)gun
{
    return _gun;
}

#pragma mark - 士兵行为 -

- (void)run
{
    NSLog(@"士兵%@狂奔", _name);
}

- (void)dead
{
    _healthPoint = 0;
    NSLog(@"士兵%@阵亡", _name);
}

- (void)shoot
{
    NSLog(@"士兵%@开枪", _name);
    
    // 通过 #warning 可以起到一个提示作用
//    #warning gun开火方法
    [_gun fire];
}


- (void)reload
{
    NSLog(@"上子弹");
    _gun.bulletCount = 10;
}

- (void)exchangeGun:(Gun *)gun
{
    NSLog(@"换枪");
    _gun = gun;
}

@end







