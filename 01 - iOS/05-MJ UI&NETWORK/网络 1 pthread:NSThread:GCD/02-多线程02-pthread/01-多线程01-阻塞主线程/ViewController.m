//
//  ViewController.m
//  01-多线程01-阻塞主线程
//
//  Created by 赵赤赤 on 15/9/12.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"
#import <pthread.h>

@interface ViewController ()
- (IBAction)btnClick:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


void *run(void *data)
{
    NSThread *currentThread = [NSThread currentThread];
    
    for (int i=0; i<20000; i++) {
        NSLog(@"run-----%@", currentThread);
    }
    
    return NULL;
}

- (IBAction)btnClick:(id)sender {
    // 1.获取当前线程
    NSThread *currentThread = [NSThread currentThread];
    NSLog(@"btbClick-----%@", currentThread);
    
    // 2.执行一些耗时操作:创建一条子线程
    pthread_t threadId;
    pthread_create(&threadId, NULL, run, NULL);
    
}
@end
