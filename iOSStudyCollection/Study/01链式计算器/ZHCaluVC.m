//
//  ZHCaluVC.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/5.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHCaluVC.h"
#import "NSObject+Calculate.h"

@interface ZHCaluVC ()

@end

@implementation ZHCaluVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    float a = [NSObject makeCalculate:^(CalculateManager *make) {
        make.add(5).sub(3).multiple(10).divide(5);
    }];
    NSLog(@"%g", a);
}

@end
