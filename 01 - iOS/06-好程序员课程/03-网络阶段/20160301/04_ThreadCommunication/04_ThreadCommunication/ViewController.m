//
//  ViewController.m
//  04_ThreadCommunication
//
//  Created by baoxu on 16/3/1.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    SEL sel[3] = {
        @selector(nsThread),
        @selector(gcd),
        @selector(nsOperation)
    };
    
    for (int i = 0; i<3; i++) {
        NSThread *thread = [[NSThread alloc]initWithTarget:self selector:sel[i] object:nil];
        [thread start];
    }
    
}

#pragma mark -三种回调主线程的方法-

-(void)nsThread{
    NSLog(@"nsthread:%@",[NSThread currentThread]);
    //子线程执行该方法，NSThread方法回调主线程，让主线程做某事（比如刷新UI）
    [self performSelectorOnMainThread:@selector(finish) withObject:nil waitUntilDone:NO];
    
    //回调其他子线程也是可以的，几乎不用
//    self performSelector:<#(nonnull SEL)#> onThread:<#(nonnull NSThread *)#> withObject:<#(nullable id)#> waitUntilDone:<#(BOOL)#>
    
}
-(void)gcd{
    NSLog(@"gcd:%@",[NSThread currentThread]);
    
    //GCD方法回去主线程，做某事
    dispatch_async(dispatch_get_main_queue(), ^{
        [self finish];
    });
}
-(void)nsOperation{
    NSLog(@"nsOperation:%@",[NSThread currentThread]);
    //operation方法获取主队列，做某事
    NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
    [mainQueue addOperationWithBlock:^{
        [self finish];
    }];
}


//主线程要做的事（一般是刷新UI）
-(void)finish{
    NSLog(@"finish：%@",[NSThread currentThread]);
    NSLog(@"完成");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
