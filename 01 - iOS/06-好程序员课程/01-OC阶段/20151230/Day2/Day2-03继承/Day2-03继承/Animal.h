//
//  Animal.h
//  Day2-03继承
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

// 1.设计父类不要使其功能太过强大，这样会增加类与类之间的耦合关系
// 2.父类就是其他子类中相同或相似属性和功能的一个集成封装，也就是说是子类共性的抽取
// 3.继承关系中子类可以共享父类的方法，这样就简化了代码的复杂程度，减少了相同逻辑的出现
// 4.继承关系会增加耦合度，复用程度低

#import <Foundation/Foundation.h>

@interface Animal : NSObject
{
    NSString *_sex;
    NSUInteger _age;
    NSString *_type;
}

// 构造方法：就是以init开头的方法，用来初始化属性
- (instancetype)initWithType:(NSString *)type
                         age:(NSUInteger)age
                         sex:(NSString *)sex;

// 属性生成器 @property 属性类型 属性名称（不加"_"）
// @property 会自动生成 set 和 get 方法
// @property 会自动生成相应的以下划线开头的成员变量(私有的)
@property NSString *sex;
@property NSUInteger age;
@property NSString *type;

- (void)move;
- (void)sleep;
- (void)eat;

@end





