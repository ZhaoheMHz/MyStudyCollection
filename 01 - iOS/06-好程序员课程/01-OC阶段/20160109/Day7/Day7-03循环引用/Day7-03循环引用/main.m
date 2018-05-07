//
//  main.m
//  Day7-03循环引用
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        Car *car = [[Car alloc] init];
        
        // 循环引用: 对象之间，都用强指针进行互相引用后，就会造成循环引用，对象无法被销毁
        // 内存泄露
        // 解决方案：把其中一个对象的引用，改为weak弱引用
        person.car = car;
        car.person = person;
    }
    
    return 0;
}





