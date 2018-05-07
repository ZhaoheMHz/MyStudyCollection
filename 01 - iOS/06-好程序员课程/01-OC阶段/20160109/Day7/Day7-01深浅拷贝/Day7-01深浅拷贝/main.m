//
//  main.m
//  Day7-01深浅拷贝
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

void test()
{
    Person *person = [[Person alloc] init];
    person.name = @"123";
    
    [person release];
    
    
    // 深浅拷贝
    // 1.深拷贝:重新开辟一块新的内存空间，用来存放对象的拷贝，然后把新对象的地址赋给新的指针变量
    
    // 2.浅拷贝:对对象地址的拷贝，不会生成新的对象内存空间
    NSString *string = @"string";
    NSLog(@"string%p", string);
    
    // copy 是不可变拷贝
    // 1.copy 一个不可变对象，就是浅拷贝
    // 2.copy 一个可变对象，就是深拷贝
    // 3.copy 最后返回的对象一定是不可变的
    
    // mutableCopy 可变拷贝
    // 无论拷贝的对象是可变还是不可变的，最后都会进行深拷贝，而且拷贝出来的空间一定是可变的
    NSString *string1 = [string copy];
    NSLog(@"string1%p", string1);
    
    NSMutableString *mutableString =
    [NSMutableString stringWithString:string];
    NSLog(@"mutableString:%p", mutableString);
    
    NSString *string2 = [mutableString copy];
    NSLog(@"string2:%p", string2);
    
    // mutableCopy
    // 声明时 string1 是 NSString * 类型的，并且指向了一块不可变空间
    
    // 通过 mutableCopy方法，把深拷贝后的对象地址赋给string1时，string1指向了一块可变空间
    string1 = [string mutableCopy];
    NSLog(@"string1: %p", string1);
    
    // mutableCopy 一个不可变对象
    // 标准写法
    NSMutableString *string3 =
    [string mutableCopy];
    NSLog(@"string3: %p", string3);
    
    // mutableCopy 一个可变对象
    string3 = [string3 mutableCopy];
    NSLog(@"string3: %p", string3);
    
    // string1.class 获得的类型是 声明string1时对应的对象类型
    //        NSLog(@"class: %@", NSStringFromClass(string3.class));
    //        [string3 setString:@""];
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Person *person = [[Person alloc] init];
//        NSMutableString *string =
//        [NSMutableString stringWithString:@"小红"];
        NSString *string = @"小红";
        
        person.name = string;
        [person eat];
        
//        [string setString:@"小黄"];
        string = @"小黄";
        [person eat];
        
        [person release];
    }
    
    return 0;
}




