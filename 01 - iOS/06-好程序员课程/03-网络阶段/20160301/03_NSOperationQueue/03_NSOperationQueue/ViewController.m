//
//  ViewController.m
//  03_NSOperationQueue
//
//  Created by baoxu on 16/3/1.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
/**
 *  iOS中有多重多线程实现方式，苹果公司是建议使用operation技术的
    1.GCD是纯C的，对于面向对象的程序员不友好
    2.GCD对线程的管理还不是很强大
 
    NSOperation是基于GCD的
    
    dispatch_queue   == NSOperationQueue
    dispatch_async() == NSOperation
    dispatch_sync()  == NSOperation

    NSOperation是一个抽象类，定义了NSOperation的一些基本方法，我们需要使用它的子类：
    NSBlockOperation；NSInvocationOperation
 
 */

@property (strong, nonatomic) NSOperationQueue *queue;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//只看任务
- (IBAction)palyOnMainThread:(id)sender {
    //默认在主线程上执行，会阻塞主线程
    //不需要把任务交给队列管理就能执行，执行方法类似于dispatch_sync，同步执行
    //1.申请一个任务（self响应eat方法）
//    NSInvocationOperation *iop = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(eat) object:nil];
//    //执行任务
//    [iop start];
 
    
    //2.来一个block任务
    //默认也是在主线程中执行
    //添加多个任务的时候会并发执行（开启新线程执行添加的任务）
    NSBlockOperation *bop = [NSBlockOperation blockOperationWithBlock:^{
        [self eat];
    }];
    //添加一个任务
    [bop addExecutionBlock:^{
        [self drink];
    }];
    //完成任务后给个回调
    bop.completionBlock = ^{
        NSLog(@"任务完成了");
    };
    
    [bop start];
    NSLog(@"往下走了");
    
}

//NSOperationQueue来管理任务
- (IBAction)playOnQueue:(id)sender {
    
    //先来三个任务
    NSInvocationOperation *iop1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(eat) object:nil];
    NSInvocationOperation *iop2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(drink) object:nil];
    NSBlockOperation *bop = [NSBlockOperation blockOperationWithBlock:^{
        [self sleep];
    }];
    [bop addExecutionBlock:^{
        NSLog(@"吃吃喝喝睡睡");
    }];
    
    
    //1.一旦把任务交给队列管理，队列的任务是并发执行的
    //2.任务都是在子线程中完成，自动创建子线程执行任务
    //3.不需要调用start方法，交给队列后自动执行
    
    //创建队列
    NSOperationQueue * queue = [[NSOperationQueue alloc]init];
    
    //在同一时间的最大并发数量，这一点就完胜GCD，需要在任务执行之前设定
    queue.maxConcurrentOperationCount = 2;
    
    //把任务给队列管理
    [queue addOperation:iop1];
    [queue addOperation:iop2];
    [queue addOperation:bop];
    
}
//控制NSOperationQueue的顺序
- (IBAction)playOnQueueControl:(id)sender {
    NSInvocationOperation *iop1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(eat) object:nil];
    NSInvocationOperation *iop2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(drink) object:nil];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    /**
     *  可以给任务添加依赖关系
        iop2依赖于iop1，那么，1先2后
        相当于间接的设定了任务的顺序，相当于串行执行（1、2的执行线程不一定是同一条）
     */
    //依赖关系必须在添加到任务队列前设置
    [iop2 addDependency:iop1];
    
//    [queue addOperation:iop1];
//    [queue addOperation:iop2];
    
    [queue addOperations:@[iop2,iop1] waitUntilFinished:NO];
    
    //如果是YES，会挂起主线程，等待所有任务都完成才能继续执行
    NSLog(@"往下走了");
    
}

//进一步控制Queue
- (IBAction)playOnQueueControl2:(id)sender {
    NSInvocationOperation *iop1 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(eat) object:nil];
    NSInvocationOperation *iop2 = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(drink) object:nil];
    
    NSOperationQueue *queue = [[NSOperationQueue alloc]init];
    
    [iop1 addDependency:iop2];
    
    [queue addOperation:iop2];
    [queue addOperation:iop1];
    
    self.queue = queue;
}
//暂停
- (IBAction)btnPause:(id)sender {
    /**
     *  正在执行的任务不受暂停影响
        只有还没有执行的任务才能被暂停
        queue是并发执行的，需要设置依赖关系才能有未执行的任务，暂停才能起作用
     */
    [self.queue setSuspended:YES];
}

- (IBAction)btnResume:(id)sender {
    
    [self.queue setSuspended:NO];
    
}

- (IBAction)btnCancel:(id)sender {
    //只能取消所有未执行的任务，取消后不能继续
    [self.queue cancelAllOperations];
}


#pragma mark -来几个任务-
-(void)eat{
    int i = 0;
    while (i++<10) {
        NSThread *thread = [NSThread currentThread];
        NSLog(@"%@",thread);
        NSLog(@"%@吃了%d秒了，不怕胖么",thread.name,i);
        [NSThread sleepForTimeInterval:1.0];
    }
}

-(void)drink{
    int i = 0;
    while (i++<10) {
        NSThread *thread = [NSThread currentThread];
        NSLog(@"%@",thread);
        NSLog(@"%@喝了%d秒了，一会就得去厕所",thread.name,i);
        [NSThread sleepForTimeInterval:1.0];
    }
}

-(void)sleep{
    int i = 0;
    while (i++<10) {
        NSThread *thread = [NSThread currentThread];
        NSLog(@"%@",thread);
        NSLog(@"%@睡了%d秒了，你是🐷么",thread.name,i);
        [NSThread sleepForTimeInterval:1.0];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
