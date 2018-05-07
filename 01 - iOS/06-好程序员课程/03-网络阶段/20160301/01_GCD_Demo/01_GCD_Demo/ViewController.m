//
//  ViewController.m
//  01_GCD_Demo
//
//  Created by baoxu on 16/3/1.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end
/**
 *  1>.GCD是什么？
        Grand Central Dispatch（多线程优化技术），GCD的使用离不开dispatch；
        是一套底层的API，基于C语言开发的多线程机制，提供了新的模式编写并发执行的程序。
 
        特点：
            1.允许将一个程序分为多个单一的任务，提交到工作队列当中，串行或者并发执行
            2.配合block，使用起来更加方便灵活
            3.自动管理线程的生命周期（创建，调度，销毁），完全不需要我们手动管理，只告诉他任务就好
            4.为多核并行运算器提供了解决方案，自动合理的利用CPU内核
 
    2>.什么是Queue队列？
        GCD使用了队列的概念，管理线程执行任务，解决了NSThread难于管理的问题；队列实际上就是数组的概念，通常都是把要执行任务添加到队列中
        特点：
        1.按照顺序执行，先进先出
        2.队列可以管理多线程，管理并发执行的任务，设置主线程
        3.GCD的队列是（任务）的队列，而不是（线程）的队列
 
    3>.什么是任务？
        任务即操作，你想要干什么，说白了就是一段代码，就是block里面的东西
        任务两种执行方式：
        同步执行：当前无返回不往下走，只要是同步，不会开线程，都在当前线程执行
        异步执行：并发的，只要是异步的，都会开启线程，在新的线程中执行
    4>.什么是串行队列？
        依次执行队列中的每个任务
    5>.什么是并行队列？
        好像所有任务都是同一时间执行的
    6>.都有哪些队列？
        主队列、全局队列、自定义队列
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"%d",[NSThread isMultiThreaded]);
    //自定义
//    [self createMyQueues];
    //全局
//    [self getGlobalQueue];
    //主队列
    [self getMainQueue];
}
#pragma mark -GCD的任务队列-
/**
 *  GCD的任务队列有三种
    1.自定义队列
    2.获取全局队列
    3.获取主队列
 */

//3.获取主队列
-(void)getMainQueue{
    //获取主队列的方法（dispatch_get_main_queue）
    //可以实现GCD保护
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"主队列%@",[NSThread currentThread]);
        NSLog(@"主队列%d",[NSThread isMultiThreaded]);
        
        [self printFirst];
        [self printForth];
    });
}

//2.获取全局队列
-(void)getGlobalQueue{
    
    /**
     全局队列特点：
        1.可以同时执行多个任务，每个任务的启动时间是按照添加到queue的顺序执行的
        2.全局队列能够实现并行，获取不同的全局队列开启的线程不同，想要串行必须写在同一个block里面
        3.我们不能够自己手动创建，只能获取和调度
     */
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    //第一个参数：运行级别（高，默认，低，后台）
    //第二个参数：不需要标记，给个0就OK
    
    dispatch_async(queue, ^{
        NSLog(@"全局%@",[NSThread currentThread]);
        NSLog(@"全局%d",[NSThread isMultiThreaded]);
        
        [self printFirst];
        [self printForth];
    });
    dispatch_async(queue, ^{
        NSLog(@"全局%@",[NSThread currentThread]);
        NSLog(@"全局%d",[NSThread isMultiThreaded]);
        
        [self printThird];
        [self printSecond];
    });
    
    //直接使用全局队列
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [self printThird];
        [self printForth];
    });
}


//1.自定义队列
-(void)createMyQueues{
    //1.如何实现一个类似NSThread的功能？
    //2.如何将一个任务交给队列？
    
    //GCD的队列
    dispatch_queue_t myQueue = dispatch_queue_create("myQueue", NULL);
    //参数一：给一个运行标记
    //参数二：属性，一般为NULL
    //1.同步演示
//    [self printFirst];
//    dispatch_sync(myQueue, ^{
//        NSLog(@"同步%@",[NSThread currentThread]);
//        NSLog(@"同步%d",[NSThread isMultiThreaded]);
//        //只要是同步，就不开线程
//        [self printFirst];
//    });
//    dispatch_sync(myQueue, ^{
//        [self printThird];
//    });
//    
//    NSLog(@"同步完成");
    
    
    //2.异步演示
    
    //任务在同一个队列里面是串行的
//    dispatch_async(myQueue, ^{
//        //只要是异步，肯定开线程
//        NSLog(@"异步%@",[NSThread currentThread]);
//        NSLog(@"异步%d",[NSThread isMultiThreaded]);
//        
//        [self printFirst];
//        [self printThird];
//        //下面的dispatch和这样写是一样的
////        [self printSecond];
////        [self printForth];
//    });
//    dispatch_async(myQueue, ^{
//        NSLog(@"异步%@",[NSThread currentThread]);
//        NSLog(@"异步%d",[NSThread isMultiThreaded]);
//        
//        [self printSecond];
//        [self printForth];
//    });
//    NSLog(@"异步完成");
    
    
    //3.多队列任务
    dispatch_queue_t queue1 = dispatch_queue_create(NULL, NULL);
    dispatch_queue_t queue2 = dispatch_queue_create(NULL, NULL);
    dispatch_queue_t queue3 = dispatch_queue_create(NULL, NULL);
    dispatch_queue_t queue4 = dispatch_queue_create(NULL, NULL);

//    dispatch_async(queue1, ^{
//        [self printFirst];
////        [self printSecond];
//    });
//    dispatch_async(queue1, ^{
//        [self printSecond];
//    });
//    dispatch_async(queue3, ^{
//        [self printThird];
//    });
//    dispatch_async(queue4, ^{
//        [self printForth];
//    });

    //4.创建组队列（能够实现全部完成任务后执行某事）
    dispatch_group_t groupQueue = dispatch_group_create();
    //将任务统一添加到组里面
    dispatch_group_async(groupQueue, queue1, ^{
        [self printFirst];
    });
    dispatch_group_async(groupQueue, queue2, ^{
        [self printSecond];
    });
    dispatch_group_async(groupQueue, queue3, ^{
        [self printThird];
        [self printForth];
        
    });
    //组内所有的方法都执行完，才会调用完成通知
    dispatch_group_notify(groupQueue, queue4, ^{
        [self printFinish];
    });
    
//    [self printFinish];
}

#pragma mark -任务-
-(void)printFirst{
    for (int i=0; i<10; i++) {
        NSLog(@"第一个任务执行第%d部",i);
        [NSThread sleepForTimeInterval:1.0];
    }
}

-(void)printSecond{
    for (int i=0; i<10; i++) {
        NSLog(@"第二个任务执行第%d部",i);
        [NSThread sleepForTimeInterval:1.0];
    }
}

-(void)printThird{
    for (int i=0; i<10; i++) {
        NSLog(@"第三个任务执行第%d部",i);
        [NSThread sleepForTimeInterval:1.0];
    }
}
-(void)printForth{
    for (int i=0; i<10; i++) {
        NSLog(@"第四个任务执行第%d部",i);
        [NSThread sleepForTimeInterval:1.0];
    }
}

-(void)printFinish{
    NSLog(@"任务完成");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
