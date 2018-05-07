//
//  main.m
//  Day2-03继承
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dog.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Dog *dog =
        [[Dog alloc] initWithType:@"金毛"
                              age:1
                              sex:@"公"];
        [dog bark];
        
        NSLog(@"性别: %@", dog.sex);
        dog.sex = @"母";
        NSLog(@"性别: %@", dog.sex);
        
        // 属性生成器，只会和下划线开头的成员变量进行关联
        dog.weight = 2;
        
        // 在继承关系中，父类指针可以指向子类对象
        Animal *dog1 = [[Dog alloc] init];
        [dog1 eat]; // 调用的是Dog中eat的逻辑
        
//        Dog *dog2 = [[Animal alloc] init];
//        [dog2 bark];
    }
    
    return 0;
}





