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
    
    // 2.执行一些耗时操作
    for (int i=0; i<10000; i++) {
        // 3.输出线程
        NSLog(@"%@", currentThread);
    }
}
@end
