//
//  main.m
//  Day8-Block中的循环引用
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Train.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *person = [[Person alloc] init];
        Train *train = [[Train alloc] init];
        
        person.name = @"马云";
        
        // block中不能直接改变其中变量的值, 需要添加__block
        int __block number = 10;
        
        // 1.设置block属性
        // 当把一个对象指针放在block中时，block就可以拥有对象的绝对使用权
        
        // * block实际上就是OC的对象，存放在栈中
        // * block写成属性时，要使用copy约束，使用strong，其实内部就是在执行copy操作
        
        // 声明一个同类型的对象指针，弱引用该对象
        // typeof(对象) --> 获取对象指针类型 Train *
        Person *p = [Person new];
        Person __weak *p1 = p;
        
        typeof(train) __weak weakTrain = train;
        [train setBlock:^{
//            person = nil;
            // block会导致对象计数器+1
            person.name = @"mayun";
//            train.name = @"和谐号";
//            weakTrain.name = @"和谐号";
            number = 15;
        }];
        
//        void (^test)() = ^{
//            NSLog(@"test");
//            number = 12;
//        };
//        
//        train.block = test;
        
        // 2.执行block中的逻辑
        [train run];
        
        NSLog(@"%@", person.name);
        person = nil;
        
#if 0
        [train readyForRunningWithBlock:^{
            [person buyTicketTo:@"乌镇"
                           from:@"北京"];
        }];
        
        [train startup];
        [train run];
#endif
    }
    return 0;
}



