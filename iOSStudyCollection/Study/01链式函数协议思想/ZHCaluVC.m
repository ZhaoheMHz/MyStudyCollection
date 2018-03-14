//
//  ZHCaluVC.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/5.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHCaluVC.h"
#import "NSObject+Calculate.h"
#import "ZHSQLTool.h"

@interface ZHCaluVC ()

@end

@implementation ZHCaluVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 计算器例子
    float a = [NSObject makeCalculate:^(CalculateManager *make) {
        make.add(5).sub(3).multiple(10).divide(5);
    }];
    NSLog(@"%g", a);
    
    
    
    // sql语句例子
    NSString *sqlStr = [ZHSQLTool makeSql:^(ZHSQLTool<ISSelectEnable> *tool) {
        tool.select(@"uid").from(@"userTable").join(@"chefTable").where(@"uid>100");
    }];
    NSLog(@"%@", sqlStr);
}

@end
