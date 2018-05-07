//
//  main.m
//  Day2-02new方法的实现原理
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Soldier.h"
#import "Son.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // nil（0x0）代表的是一个空指针
        // 当使用一个值为nil的对象指针 去调用方法时，什么都不会发生，也不会报错
//        Soldier *soldier = nil;
//        [soldier setName:@"xxx"];
        
        // new方法（类方法）
        // 1 为对象分配内存空间
        // 2 初始化对象
        // 3 返回对象地址
        Soldier *soldier = [Soldier new];
        NSLog(@"%@", soldier);
        
        // 这里，Son 就是我们这个new方法的接收者，而在方法内部实现中，self就会在编译时，被替换成Son
        // 看对象不看指针
        
        // isa 是一个Class类型的指针
        // 1.实例化一个对象后，这块空间里面就会生成一个isa指针，指向的是对象所属的类结构体
        // 2.类中也有一个isa指针，指向的是元类（直属父类）
        Son *son = [Son new];
    }
    
    return 0;
}








