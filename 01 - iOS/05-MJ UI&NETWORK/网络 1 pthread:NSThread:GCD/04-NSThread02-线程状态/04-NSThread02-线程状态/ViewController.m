//
//  ViewController.m
//  04-NSThread02-线程状态
//
//  Created by 赵赤赤 on 15/9/14.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSThread *thread;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.thread = [[NSThread alloc] initWithTarget:self selector:@selector(test) object:nil];
    self.thread.name = @"线程A";
}

- (void)test
{
    NSLog(@"test方法开始了----%@", [NSThread currentThread]);
    
//    [NSThread sleepForTimeInterval:5];

    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:2];
    [NSThread sleepUntilDate:date];
    
//    [NSThread exit];
    
    for (int i=0; i<1000; i++) {
        NSLog(@"te st----%d---%@-----", i, [NSThread currentThread].name);
        if (i==50) {
            [NSThread exit];
        }
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 开启线程
    [self.thread start];
}

@end
