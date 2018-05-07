//
//  Person.h
//  Day10-02KVO
//
//  Created by ZhangChao on 16/1/13.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) Car *car;

- (instancetype)initWithName:(NSString *)name car:(Car *)car;

@end




