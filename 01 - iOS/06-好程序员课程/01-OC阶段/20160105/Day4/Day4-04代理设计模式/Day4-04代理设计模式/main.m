//
//  main.m
//  Day4-04代理设计模式
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boss.h"
#import "Worker.h"

// 场景：Boss 开了家公司，想找一个人（worker）买木头
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Boss *boss = [[Boss alloc] init];
        Worker *worker = [[Worker alloc] init];
        
        // 设置代理
        boss.delegate = worker;
        [boss work];
    }
    return 0;
}


