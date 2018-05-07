//
//  Person.h
//  Day7-ARC自动引用计数
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject

// arc属性的约束
// 1.使用strong 替换 retain
// 2.使用weak 弱引用一个对象时，如果对象被销毁，这个弱指针会被立即置为nil
// 3.使用assign 弱引用一个对象，对象销毁后，指针不会被置为nil
// 4.弱引用一个对象，最好使用weak
// 5.weak是针对对象而言
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, weak) Car *car;

@end






