//
//  main.m
//  Day10-Runtime
//
//  Created by ZhangChao on 16/1/13.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

// Runtime: 动态运行时机制
// Runtime 是基于C实现的

#import <Foundation/Foundation.h>
// 要使用Runtime的函数，必须导入 objc/runtime.h
#import <objc/runtime.h>
#import <objc/message.h>
#import "Person.h"
#import "NSObject+MyKVC.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        NSLog(@"%@", [person class]);
        
        // 动态获取person的类型
        Class personClass = person.class;
        // outCount 用来记录方法个数
        unsigned int outCount;

        Method *methodPtr = class_copyMethodList(personClass, &outCount);
        for (int i = 0; i < outCount; i++) {
            Method method = methodPtr[i];
            
            // 获取方法的名称
            SEL selector = method_getName(method);
            
            // NSStringFromSelector()
            // 返回选择器中方法的名称
            // NSStringFromClass()
//            NSLog(@"%@", NSStringFromSelector(selector));
        }
        
        // 查看类中的实例变量
        Ivar *ivarPtr = class_copyIvarList(personClass, &outCount);
        for (int i = 0; i < outCount; i++) {
            Ivar ivar = ivarPtr[i];
//            NSLog(@"%s", ivar_getName(ivar));
        }
        
        // 查看类中的属性
        objc_property_t *propertyPtr = class_copyPropertyList(personClass, &outCount);
        for (int i = 0; i < outCount; i++) {
            objc_property_t property =
            propertyPtr[i];
            
            NSLog(@"%s", property_getName(property));
            // T@"NSString",C,N,V_name
            // T类型, C(copy), N(nonatomic), 对应的实例变量
            NSLog(@"%s", property_getAttributes(property));
            
            // 消息机制
            [person setName:@"xxx"];
            
            // Build Setting--> enable strict
            // objc_msgSend(消息接收者, 消息名称);
            // NSSelectorFromString(nil);
            objc_msgSend(person, @selector(setName:), @"Tom");
            
            [person setValue:@"xxx"
                      forKey:@"name"];
            [person my_setValue:@"222"
                         forKey:@"name"];
            NSLog(@"%@", person.name);
            
            [person my_setValue:@20
                         forKey:@"age"];
        }
    }
    
    return 0;
}






