//
//  ViewController.m
//  A5GCD
//
//  Created by 赵赤赤 on 15/9/23.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        int i = 0;
        while (i++ < 5) {
            sleep(1);
            NSLog(@"====%d", i);
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            // 这里是主线程
        });
    });
    
    // 如果block内部使用某个指针,报和内存有关的警告
    // 我们就需要对这个指针做弱引用处理
    __weak ViewController *weakSelf = self;
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSURL *url = [NSURL URLWithString:@"http://pic.hltm.tv/uploads/editor/2015/09/20150911055216832.jpg"];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            weakSelf.view.backgroundColor = [UIColor colorWithPatternImage:image];
        });
    });
}

@end
