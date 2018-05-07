//
//  main.m
//  Day2-01对象组合
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

// 面向对象编程的三大特性
// 1.封装：隐藏具体的逻辑实现，对外暴露接口
// 2.继承：单继承、多继承，OC只支持单继承，一个子类只能有一个直属父类，在继承链中，子类可以直接使用父类头文件中声明的方法，非私有的属性子类也可以直接使用
// 3.多态：相同的方法，可以有不同的逻辑实现

#import <Foundation/Foundation.h>
#import "Gun.h"
#import "Soldier.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        
        Gun *gun = [Gun new];
        Soldier *soldier = [Soldier new];
        
        // OC类中，但凡是头文件中声明的方法，都是公有的
        // 我们可以通过调用方法，间接操作属性，这样做可以让语义更加明确，是良好封装的体现
        [gun setType:@"巴雷特"];
        [gun setBulletCount:10];
        [gun setHolder:soldier];
        
        // 点语法就是在调用 set 或 get方法
        soldier.name = @"王祖蓝";
        soldier.healthPoint = 100;
        soldier.gun = gun;
        
        [soldier run];
        for (NSInteger i = 0; i < 20; i++) {
            [soldier shoot];
        }
        [soldier dead];
    }
    
    return 0;
}







