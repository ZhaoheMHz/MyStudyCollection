//
//  ViewController.m
//  A1NSThread
//
//  Created by 赵赤赤 on 15/9/23.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 当NSThread线程在结束的时候,会向工程发送一个通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listenUp:) name:NSThreadWillExitNotification object:nil];
}

- (void)listenUp:(NSNotification *)notify {
    // NSThread线程结束时发的通知里,参数就是这个线程自己
    NSThread *thread = notify.object;
    
    NSLog(@"end = %@", thread.name);
}

- (IBAction)threadMain:(UIButton *)sender {
    // 默认情况下,代码都是在主线程里执行的
    for (int i=1; i<6; i++) {
        sleep(1);
        NSLog(@"main = %d", i);
    }
}

- (IBAction)threadOne:(UIButton *)sender {
    // 手动创建一个子线程
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(oneRun) object:nil];
    
    // 设置属性
    thread.name = @"one";
    
    // 启动子线程(让thread记录的target在子线程中执行selector方法)
    [thread start];
}

- (void)oneRun {
    int i = 0;
    while (i++ < 5) {
        sleep(1);
        NSLog(@"one = %d", i);
    }
}

- (IBAction)threadTwo:(UIButton *)sender {
    // 创建一个子线程,并且立即执行
    [NSThread detachNewThreadSelector:@selector(twoRun) toTarget:self withObject:nil];
}

- (void)twoRun {
    // 找到当前线程
    NSThread *thread = [NSThread currentThread];
    thread.name = @"two";
    
    int i = 0;
    while (i++ < 5) {
        sleep(1);
        NSLog(@"two = %d", i);
        if (i == 3) {
            // 退出当前线程
            [NSThread exit];
        }
    }
}

- (IBAction)test:(UIButton *)sender {
    NSLog(@"test");
}


@end
