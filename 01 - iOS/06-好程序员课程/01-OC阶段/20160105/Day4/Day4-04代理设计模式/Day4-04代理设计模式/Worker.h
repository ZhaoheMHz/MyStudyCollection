//
//  Worker.h
//  Day4-04代理设计模式
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Boss.h"

@interface Worker : NSObject
<BossDelegate>

- (void)sleep;

@end
