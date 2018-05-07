//
//  ViewController.m
//  A4NSOperationQueue
//
//  Created by 赵赤赤 on 15/9/23.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    // 操作队列
    NSOperationQueue *_queue;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 创建操作队列
    _queue = [[NSOperationQueue alloc] init];

    // 允许同时执行的最多操作个数(线程数)
    _queue.maxConcurrentOperationCount = 4;
    
    // 创建一个普通的任务
    NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(oneRun) object:nil];
    
    // 任务完成的回调
    invocationOperation.completionBlock = ^{
        NSLog(@"任务一完成了");
    };
    
    // 将任务加到队列里
    [_queue addOperation:invocationOperation];
    
    
    
    // block任务
    NSBlockOperation *blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        int i = 0;
        while (i++ < 5) {
            sleep(1);
            NSLog(@"two = %d", i);
        }
    }];
    
    blockOperation.completionBlock = ^{
        NSLog(@"任务二完成了");
    };
    
    
    /**
     * 假设最多允许的任务个数设置为4
     * 当我们往队列里添加任务时,如果队列里已经存在的任务不到4个
     *      这个任务会立即执行
     *      否则,就会排队
     *
     * 当一个任务完成的时候,会自动从队列里消失
     *
     * 任务的执行都是在子线程中
     */
    [_queue addOperation:blockOperation];
}

- (void)oneRun {
    int i = 0;
    while (i++ < 5) {
        sleep(1);
        NSLog(@"one = %d", i);
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    NSBlockOperation *bo = [NSBlockOperation blockOperationWithBlock:^{
        int i = 0;
        while (i++ < 5) {
            sleep(1);
            NSLog(@"three = %d", i);
        }
    }];
    
    bo.completionBlock = ^{
        NSLog(@"任务三完成了");
    };
    
    [_queue addOperation:bo];
}

@end
