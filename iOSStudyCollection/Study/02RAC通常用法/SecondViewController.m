//
//  SecondViewController.m
//  CacuDemoWithMasonryModel
//
//  Created by 赵赫 on 2018/3/1.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)btnTouch:(id)sender {
    if (self.subject) {
        // 发送一个block
//        [self.subject sendNext:^(){
//
//        }];
        
        // 发送多个参数
//        [self.subject sendNext:[RACTuple tupleWithObjects:<#(nonnull id), ...#>, nil]]
        
        // 一定要执行sendCompleted，避免内存泄露
//        [self.subject sendCompleted];
    }
}


@end
