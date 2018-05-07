//
//  ViewController.m
//  05-NSThread03-线程同步
//
//  Created by 赵赤赤 on 15/9/14.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, assign) int leftTicketsCount;
@property (nonatomic, strong) NSThread *thread0;
@property (nonatomic, strong) NSThread *thread1;
@property (nonatomic, strong) NSThread *thread2;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 默认有100张
    self.leftTicketsCount = 100;
    
    // 开启多条线程
    self.thread0 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread0.name = @"售票员 A";
    
    self.thread1 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread1.name = @"售票员 B";
    
    self.thread2 = [[NSThread alloc] initWithTarget:self selector:@selector(saleTicket) object:nil];
    self.thread2.name = @"售票员 C";
}

- (void)saleTicket
{
    while (1) {
        @synchronized(self){
            // 先检查票数
            int count = self.leftTicketsCount;
            if (count>0) {
                // 暂停
                [NSThread sleepForTimeInterval:0.0002];
                
                // 票数减一
                self.leftTicketsCount = count - 1;
                
                NSLog(@"%@ 卖了一张票,剩余%d张票", [NSThread currentThread].name, self.leftTicketsCount);
            }
            else {
                [NSThread exit];
            }
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.thread0 start];
    [self.thread1 start];
    [self.thread2 start];
}

@end
