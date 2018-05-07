//
//  ViewController.m
//  07-GCD01-基本使用
//
//  Created by 赵赤赤 on 15/9/14.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    [self asyncGlobleQueue];
    
//    [self asyncSerialQueue];
    
    // 同步:不具备开启新线程的能力
//    dispatch_sync(<#dispatch_queue_t queue#>, <#^(void)block#>)
    
//    [self asyncMainQueue];
    
    [self performSelectorInBackground:@selector(test) withObject:nil];
}

- (void)test
{
    NSLog(@"===%@", [NSThread currentThread]);
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        NSLog(@"===%@", [NSThread currentThread]);
    });
}

#pragma mark - async,主队列
// 使用dispatch_async异步函数,在主线程中往主队列中添加任务:不会开新的线程,而且会继续向下执行
- (void)asyncMainQueue
{
    // 1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 2.添加任务到主线程
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片1---------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片2---------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片3---------%@", [NSThread currentThread]);
    });
}

#pragma mark - sync,主队列
// 使用dispatch_sync同步函数,在主线程中往主队列中添加任务:任务无法往下执行,因为sync中的任务需要等待viewDidLoad执行完成,viewDidLoad需要等待sync中的任务执行完成,造成死循环
- (void)syncMainQueue
{
    // 1.获得主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 2.添加任务到主线程
    dispatch_sync(queue, ^{
        NSLog(@"-------下载图片1---------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片2---------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片3---------%@", [NSThread currentThread]);
    });
    
    // 不会开启新的线程,所有任务在主线程中执行
}


#pragma mark - async,并发队列
/**
 * 异步函数中添加并发队列
 */
- (void)asyncGlobleQueue
{
    // 获取全局的并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 异步:具备开启新线程的能力
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片1---------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片2---------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片3---------%@", [NSThread currentThread]);
    });
}


#pragma mark - async,串行队列
/**
 * 异步函数中添加串行队列
 */
- (void)asyncSerialQueue
{
    // 创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("com.mhz.queue", NULL);
    
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片1---------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片2---------%@", [NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"-------下载图片3---------%@", [NSThread currentThread]);
    });
}
@end
