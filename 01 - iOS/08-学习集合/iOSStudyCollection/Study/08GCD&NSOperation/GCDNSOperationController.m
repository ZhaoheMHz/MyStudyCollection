//
//  GCDNSOperationController.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/17.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "GCDNSOperationController.h"
#import "ZHSemaphoreTool.h"
#import "YYViewHierarchy3D.h"

@interface GCDNSOperationController ()

@end

@implementation GCDNSOperationController {
    NSOperationQueue *_operationQueue;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self nsoperation];
    
    [self nsoperationSyncNetWork];
    
//    [self GCD_Semaphore];
    
    
    [YYViewHierarchy3D show];
}

// NSOperation的线程等待
- (void)nsoperation {
    _operationQueue = [[NSOperationQueue alloc] init];
    
    _operationQueue.maxConcurrentOperationCount = 2;
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self startNetworkWithWaitTime:0];
    }];
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            NSLog(@"2");
        });
    }];
    [op1 addDependency:op2];
    [_operationQueue addOperation:op1];
    [_operationQueue addOperation:op2];
}

// 尝试使用NSOperation来同步两个接口
- (void)nsoperationSyncNetWork {
    _operationQueue = [[NSOperationQueue alloc] init];
    
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self startNetworkWithWaitTime:1];
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self startNetworkWithWaitTime:3];
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"刷新页面");
    }];
    
    // 模拟op1需要依赖op2请求回来的数据
    [op1 addDependency:op2];
    // 模拟op1请求结束后刷新页面
    [op3 addDependency:op1];
    [_operationQueue addOperation:op1];
    [_operationQueue addOperation:op2];
    [_operationQueue addOperation:op3];
    
    
    
    // 也可以等待queue执行结束（不要放到主线程中进行等待！！！）
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        [_operationQueue waitUntilAllOperationsAreFinished];
        NSLog(@"刷新页面2");
    });
}




#pragma mark - GCD信号量解决网络异步
// 信号量
- (void)GCD_Semaphore {
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [self startNetworkWithWaitTime:3];
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(0, 0), ^{
        [self startNetworkWithWaitTime:1];
    });
    
    dispatch_group_notify(group, dispatch_get_global_queue(0, 0), ^{
        NSLog(@"刷新页面");
    });
}


// 模拟请求
- (void)startNetworkWithWaitTime:(double)time {
    [self networkWithSuccessBlock:^{
        NSLog(@"获取了一个接口的数据 delayTime：%g", time);
    } failBlock:^{
    } waitTime:time];
}

// 模拟网络工具1
- (void)networkWithSuccessBlock:(void (^)())successBlock failBlock:(void (^)())failBlock waitTime:(double)time {
    // 初始化一个为0的信号量
    dispatch_semaphore_t sema = dispatch_semaphore_create(0);
    
    // 直接执行延迟操作代码
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        successBlock();
        
        dispatch_semaphore_signal(sema);
    });
    
    /**
     dispatch_semaphore_wait会讲信号量-1，但前提是在信号量大于0的情况
     信号量初始值为0，这里直接等待，因为信号量现在是0，没有可用资源，所以线程被阻塞了
     等待上面的dispatch_after里的dispatch_semaphore_signal执行
     dispatch_semaphore_signal会为信号量加1，当信号量=1的时候，dispatch_semaphore_wait发现信号量不为0，对信号量-1，并继续
     */
    dispatch_semaphore_wait(sema, DISPATCH_TIME_FOREVER);
    
    
}




// 模拟网络工具2
- (void)network2WithSuccessBlock:(void (^)())successBlock failBlock:(void (^)())failBlock waitTime:(double)time {
    ZHSemaphoreTool *semaTool = [ZHSemaphoreTool creatSemaphore:0];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        successBlock();
        
        [semaTool signal];
    });
    
    [semaTool wait];
}

@end
