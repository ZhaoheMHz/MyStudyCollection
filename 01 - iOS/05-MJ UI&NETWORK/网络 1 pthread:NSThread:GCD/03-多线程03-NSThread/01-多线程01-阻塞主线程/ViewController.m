//
//  ViewController.m
//  01-多线程01-阻塞主线程
//
//  Created by 赵赤赤 on 15/9/12.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)btnClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (IBAction)btnClick:(id)sender {
    // 1.获取当前线程
    NSThread *currentThread = [NSThread currentThread];
    NSLog(@"btbClick-----%@", currentThread);
    
//    [NSThread mainThread];    // 返回主线程
//    currentThread.threadPriority      // 线程优先级
//    [currentThread isMainThread];     // 判断是否是主线程
    
//    [self createThread1];
//    [self createThread2];
    
    [self createThread3];
}

- (void)run:(NSString *)param
{
    for (int i=0; i<20000; i++) {
        NSLog(@"%@------run------%@", [[NSThread currentThread] name], param);
    }
}

- (void)createThread1
{
    // 2.执行一些耗时操作:创建一条子线程
    NSThread *thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"哈哈"];
    
    // 给线程设置名称
    thread1.name = @"线程A";
    
    // 开启线程
    [thread1 start];
    
    NSThread *thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(run:) object:@"哈哈"];
    thread2.name = @"线程B";
    
    // 开启线程
    [thread2 start];
}

- (void)createThread2
{
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"我是线程"];
}

- (void)createThread3
{
    [self performSelectorInBackground:@selector(run:) withObject:@"滚犊子"];
}

@end
