//
//  ViewController.m
//  02_NSThreadAndLock
//
//  Created by baoxu on 16/2/29.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    //线程锁
    NSLock *_threadLock;
}
/**
    atomic（原子操作）是指不会被线程机制打断的操作，这种操作一旦开始，就会有运行到结束，中间不会有任何的切换
 
    使用线程锁，他不是服务于线程，而是服务于代码，当我们想对一段代码进行原子操作的时候（数据库的写入），可以加锁
 
    关键字@synchronized也能实现原子操作，但是关键字不能再一个方法中加锁，另一个方法中解锁，lock就可以
 
 */
@end

/**
 *  线程解决耗时操作的问题
    学习
    上厕所
 
 */

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)working:(id)sender {
    [self createThread1];
}

- (IBAction)wcing:(id)sender {
//    [self createThread2];
    [self createThreads];
}

-(void)createThreads{
    for (int i=0; i<3; i++) {
        NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(doWCing) object:nil];
        thread.name = [NSString stringWithFormat:@"第%d号厕所线程",i+1];
        //设置线程的优先级
        //优先级的设定是（0~1.0）之间，值越大优先级越高
        //会有个别时候不管用，所以多线程下nsthread不是太好控
        switch (i) {
            case 0:
                thread.threadPriority = 0.5;
                break;
            case 1:
                thread.threadPriority = 0.0;
                break;
            case 2:
                thread.threadPriority = 1.0;
                break;
                
            default:
                break;
        }
        
        
        
        [thread start];
    }
}

//创建线程
-(void)createThread2{
    //方法二：类名调用方法
    //此方法创建线程，只是创建就好，会自动执行
    //为了简化我们的操作，NSObjcet封装出来的一个方法
    [NSThread detachNewThreadSelector:@selector(doWCing) toTarget:self withObject:nil];
    
    //没有取消，有退出
    //调用类名方法退出，下面的代码不会执行，主线程也会被退出，这个方法要慎用
    [NSThread exit];
    NSLog(@"%@",[NSThread currentThread]);
}

-(void)createThread1{
    //NSThread是cocoa（MacOS，iOS）中一个轻量级的线程对象
    //操作简单
    //方法一：
    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(doWorking) object:nil];
    //线程是可以命名的
    thread.name = @"工作线程";
    //用alloc创建的线程必须调用start才能运行
    [thread start];
    
    //线程如果不用了，可以取消
//    [thread cancel];
}


#pragma mark -耗时操作-
//任务一，学习
-(void)doWorking{
    NSLog(@"workingThread:%@",[NSThread currentThread]);
    int i = 0;
    while (i++<10) {
        [NSThread sleepForTimeInterval:1.0];
        NSLog(@"%@学了%d秒的习",[NSThread currentThread].name,i);
    }
    NSLog(@"完成了学习任务，收货颇多😄");
//    [[NSThread currentThread] cancel];
    
}

//任务二，上厕所
-(void)doWCing{
    NSLog(@"WCingThread:%@",[NSThread currentThread]);
    
//    //1.创建锁
//    if (_threadLock == nil) {
//        _threadLock = [[NSLock alloc]init];
//    }
//    //上锁
//    [_threadLock lock];
    
    
    //2.使用同步关键字锁
    @synchronized(self) {
        int i = 0;
        while (i++<10) {
            [NSThread sleepForTimeInterval:1.0];
            NSLog(@"%@上了%d秒的厕所",[NSThread currentThread].name,i);
        }
        NSLog(@"可下上完了厕所，感觉好爽😄");
    }
    
    //解锁
//    [_threadLock unlock];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
