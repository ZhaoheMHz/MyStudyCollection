//
//  main.m
//  Day7-ARC自动引用计数
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

// ARC（自动引用计数）
// 1.当使用一个强指针指向一个对象时，就会引起引用计数+1，这个指针就拥有了这个对象的绝对使用权。如果没有任何强指针指向这个对象时，对象就被立即销毁

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

void test()
{
    Person *person = [[Person alloc] init];
    
    @autoreleasepool {
        // arc下，用一个指针变量指向一个对象，默认就是强引用
        // 对象的生命周期和他所在的作用域有关
        
        // 回收对象
        // 1.先确定没有指针指向这个对象
        // 2.销毁对象
        person = nil;
    }
    
#if 0
    {
        Person *person2 = [[Person alloc] init];
    }
    
    Person *person1 = [[Person alloc] init];
    
#endif
}

int main(int argc, const char * argv[])
{
    // __strong 强引用一个对象（默认）
#if 0
    Person __strong *person =
    [[Person alloc] init];
    
//    person = nil;
    person = [[Person alloc] init];
    
    // __weak 弱引用
    Person *person1 = [[Person alloc] init];
    
//    person = person1;
    Person __weak *person2 = person1;
    person1 = nil;
#endif
    
    
//    Person __weak *person3 =
//    [[Person alloc] init];
    
    Person *person = [[Person alloc] init];
    Car *car = [[Car alloc] init];
    car.type = @"法拉利";
    
    person.car = car;
    car = nil;
    
    NSLog(@"%p", person.car);
    
    // assign之后，person.car仍然存着一个地址，调用方法后，就是在访问僵尸对象
    [person.car run];
    
    // 不要使用，不安全
    //__unsafe_unretained ---> assign
    
    return 0;
}











