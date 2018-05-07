//
//  Person.h
//  Day6-03MRC下Set方法
//
//  Created by ZhangChao on 16/1/8.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"

@interface Person : NSObject

@property (nonatomic, retain) Car *car;

- (void)changeCar;

@end



