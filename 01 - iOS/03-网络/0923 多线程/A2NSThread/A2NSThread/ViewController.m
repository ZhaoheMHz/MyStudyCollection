//
//  ViewController.m
//  A2NSThread
//
//  Created by 赵赤赤 on 15/9/23.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    int _page;
    
    // 线程锁(保护线程安全)
    NSLock *_lock;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _lock = [[NSLock alloc] init];
    
    _page = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(listenUp:) name:NSThreadWillExitNotification object:nil];
}

- (void)listenUp:(NSNotification *)notify {
    NSThread *thread = notify.object;
    NSLog(@"end = %@", thread.name);
}

- (IBAction)btnClick:(UIButton *)sender {
    NSThread *t1 = [[NSThread alloc] initWithTarget:self selector:@selector(oneRun) object:nil];
    t1.name = @"t1";
    [t1 start];
    
    NSThread *t2 = [[NSThread alloc] initWithTarget:self selector:@selector(twoRun:) object:t1];
    t2.name = @"t2";
    [t2 start];
}

- (void)oneRun {
    NSThread *thread = [NSThread currentThread];
    
    int i = 0;
    while (i++ < 10) {
        sleep(1);
        NSLog(@"one = %d", i);
        
        // 判断线程是否收到自杀的消息
        if ([thread isCancelled]) {
            [NSThread exit];
        }
        
        // 如果说可能会有多个线程同时操作到一个变量,需要加线程保护
        [_lock lock];
        _page ++;
        [_lock unlock];
    }
}

- (void)twoRun:(NSThread *)t1 {
    int i = 0;
    while (i++ < 5) {
        sleep(1);
        NSLog(@"two = %d", i);
        
        [_lock lock];
        _page --;
        [_lock unlock];
    }
    
    // 给t1发送一个自杀的消息
    [t1 cancel];
}

@end
