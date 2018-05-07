//
//  main.m
//  01-aop基本语法实现
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 
 对一个类的扩展
 
 1.继承
   1.不需要知道原来类的具体实现(不需要有源代码)
   2.缺点必须子类类化,才能应用新的功能
 
 2.category
 
 如果我觉得,原来的类中,方法不够强大,还不想设计新的方法(run)
 
 AOP: 面向切面编程思想,就是在不改变原来方法的名称以及使用习惯的情况下,修改其内部的实现逻辑
 
 */

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        
        /*
        Method oldMethod =  class_getInstanceMethod([NSArray class], @selector(lastObject));
        Method newMethod = class_getInstanceMethod([NSArray class], @selector(my_lastObject));
        method_exchangeImplementations(oldMethod, newMethod);
        */
    
        NSArray * tmp = @[@"2",@"4",@"5"];
        NSLog(@"%@",[tmp lastObject]);
                
        }
    
    return 0;
}
