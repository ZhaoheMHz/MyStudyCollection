//
//  Soldier.h
//  Day2-01对象组合
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Gun.h"

@interface Soldier : NSObject
{
    NSString *_name;
    NSUInteger _healthPoint;
    // 当A对象拥有B对象时，就可以在A所属的类中，声明一个B类型的属性
    Gun *_gun;
}

// set/get 方法（对象方法）
// 1.set写法：
// 》- 开头，
// 》返回值是void
// 》方法名称以set开头，后面紧跟成员变量去掉下划线后的部分
// 》set方法是用来完成属性赋值的

// 2.get方法
// 》- 开头
// 》返回值类型就是属性类型
// 》方法名称成员变量去掉下划线后的部分
// 》get方法是用来获取属性值的

- (void)setName:(NSString *)name;
- (void)setHealthPoint:(NSUInteger)healthPoint;
- (void)setGun:(Gun *)gun;

- (NSString *)name;
- (NSUInteger)healthPoint;
- (Gun *)gun;

- (void)run;
- (void)dead;
- (void)shoot;
- (void)reload;
- (void)exchangeGun:(Gun *)gun;

@end








