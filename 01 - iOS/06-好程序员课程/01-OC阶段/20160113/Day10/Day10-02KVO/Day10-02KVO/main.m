//
//  main.m
//  Day10-02KVO
//
//  Created by ZhangChao on 16/1/13.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Car.h"

// KVO（键值观察）
// 1.KVO是一种轻量级的观察者模式
// 2.用来观察value的变化
// 3.观察者模式可以极大程度的解耦合

// Person类  Account类
// person 买东西刷卡，当账户中资金发生变动时，person就会收到一条短信，打印余额

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Car *car = [[Car alloc] init];
        car.type = @"234";
        Person *person = [[Person alloc] init];
        
        // person 设置为 car对象的观察者，用来观察属性的变化
        // 换肤功能
        
        // 1.添加观察者
        // NSKeyValueObservingOptionNew
        // 观察属性的新值
        
        // NSKeyValueObservingOptionOld | NSKeyValueObservingOptionNew
        // 观察属性的新旧值得变化
        
        // NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
        // 观察到初始化属性的值
        [car addObserver:person forKeyPath:@"type" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial context:NULL];
        
        // nil--->宝马
        car.type = @"宝马";
        car.type = @"123";
        
        
        // 3.观察者用完后，要进行移除，否则程序崩溃
        [car removeObserver:person
                 forKeyPath:@"type"];
        
        Person *person1 = [[Person alloc] init];
        [person1 setValue:car forKey:@"car"];
        
        // person1.car.type 通过KVC赋值
        [person1 setValue:@"奔驰"
               forKeyPath:@"car.type"];
        NSLog(@"%@", person1.car.type);
        
        [person1 setValue:@"未知" forKeyPath:@"sex"];
    }
    
    return 0;
}





