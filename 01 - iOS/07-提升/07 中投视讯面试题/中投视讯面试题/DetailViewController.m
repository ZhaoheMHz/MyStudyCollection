//
//  DetailViewController.m
//  中投视讯面试题
//
//  Created by 赵赤赤 on 15/11/9.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(printDate) userInfo:nil repeats:YES];
    
    [timer fire];
}

- (void)printDate {
    NSLog(@"%@", [NSDate date]);
}


- (void)dealloc {
    NSLog(@"dealloc");
}

@end
