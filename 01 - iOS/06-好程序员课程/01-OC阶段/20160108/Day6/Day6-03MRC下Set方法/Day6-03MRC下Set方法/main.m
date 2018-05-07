//
//  main.m
//  Day6-03MRC下Set方法
//
//  Created by ZhangChao on 16/1/8.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        
        Car *car = [[Car alloc] init];
        car.type = @"凯迪拉克";
        
        Car *car1 = [[Car alloc] init];
        car1.type = @"法拉利";
        
        person.car = car;
        person.car = car;
        person.car = car1;
//        [person changeCar];
        
        [car release];
        [car1 release];
        
        [person release];
        
    }
    
    return 0;
}








