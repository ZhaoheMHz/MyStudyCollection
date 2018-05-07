//
//  Person.h
//  Day7-03循环引用
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject

@property (nonatomic, strong) Car *car;

@end





