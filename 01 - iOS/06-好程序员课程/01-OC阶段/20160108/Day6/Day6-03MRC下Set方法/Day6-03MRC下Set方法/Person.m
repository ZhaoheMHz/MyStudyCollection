//
//  Person.m
//  Day6-03MRC下Set方法
//
//  Created by ZhangChao on 16/1/8.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"person被销毁");
    [_car release];
    
    [super dealloc];
}

- (void)changeCar
{
    Car *newCar = [[Car alloc] init];
    
    // MRC下，调用set方法会引起引用计数+1
    self.car = newCar;
    _car = newCar; // 这里不会引起对象引用计数+1
    
    [newCar release];
}

// MRC下的set方法
//@property (nonatomic, assign) Car *car
//- (void)setCar:(Car *)car
//{
//    _car = car;
//}

// @property (nonatomic, retain) Car *car;
- (void)setCar:(Car *)car
{
    // 3.如果_car指向的对象，和car指向的是同一个，就不用重复进行 release 和 retain
    if (_car != car) {
        
        // 第一次调用set方法 _car在赋值之前是nil
        // 2.release 是为了释放旧对象
        [_car release];
        
        // 1.为了在类中可以一直持有car对象
        // retain 新对象
        _car = [car retain];
    }
}

@end



