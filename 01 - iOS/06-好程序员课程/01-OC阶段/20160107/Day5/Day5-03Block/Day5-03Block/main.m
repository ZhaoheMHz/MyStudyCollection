//
//  main.m
//  Day5-03Block
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Mother.h"
#import "OldWoman.h"

void test()
{
    NSLog(@"函数指针");
}

int main(int argc, const char * argv[])
{
    @autoreleasepool {
        // 函数指针：指向函数的指针
        // 指针函数：返回值是指针的函数
        
        // 函数指针就是把函数名称换成了一个指针变量
        // 通过函数指针，可以把一个函数作为另一个函数的参数
        void (*testPtr)() = test;
        
        test(); // 直接调用函数
        // 通过函数指针调用
        testPtr();
        
        // block 的声明
        // 就是把C函数指针的 * 换成 ^
        // = 右边的就是block的实现部分
        void (^testBlock)() = ^() {
            test();
        };
        
        // block 调用，一定要在实现block之后再去执行
        testBlock();
        
        // 告诉编译器，number 可能要在block中进行使用
        int __block number = 10;
        
        // = 右边的实现部分，无需写上返回值类型
        int (^sumBlock)(int, int) =
        ^(int a, int b) {
            
            number = 15;
            return a + b;
        };
        
        NSLog(@"number = %d", number);
        
        // block 的调用和实现是相分离的
        int sum = sumBlock(10, 15);
        NSLog(@"sum = %d", sum);
        
        NSLog(@"number = %d", number);
        
        
        
        Mother *mother = [[Mother alloc] init];
        OldWoman *oldWoman = [[OldWoman alloc] init];
        
        // block可以把紧密关联的事件逻辑，放在一起
        // block可以极大的降低耦合度
        [mother goOutsideWithAction:^{
            [oldWoman lookAfterBaby];
        }];
    }
    
    return 0;
}







