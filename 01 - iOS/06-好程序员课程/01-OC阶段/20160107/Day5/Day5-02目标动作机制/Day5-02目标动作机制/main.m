//
//  main.m
//  Day5-02目标动作机制
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mother.h"
#import "OldWoman.h"

/* 目标动作机制 (Target-Action)
 * 1.让指定的target，执行action
 * 2.当变化点比较少的时候，建议使用目标动作机制
 * 3.降低类之间的耦合度，增强类的独立性
 
 // UIButton
 */

// 有一个mother，生了一个baby，mother要外出了，想让保姆来照顾baby，打扫房屋
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Mother *mother = [[Mother alloc] init];
        OldWoman *oldWoman = [[OldWoman alloc] init];
        
        // 在执行action之前，先要添加target
        // 选择器只能同时存放一个方法
        // 把选择当做普通变量进行使用
        // 选择器不是方法的容器
        [mother addTarget:oldWoman action:@selector(doHouseWork:)];
        [mother goOutside];
    }
    
    return 0;
}




