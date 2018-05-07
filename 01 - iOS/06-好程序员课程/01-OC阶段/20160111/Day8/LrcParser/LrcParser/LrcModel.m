//
//  LrcModel.m
//  LrcParser
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "LrcModel.h"

@implementation LrcModel

+ (instancetype)modelWithTime:(float)time lrc:(NSString *)lrc
{
    LrcModel *model = [[self alloc] init];
    
    model.beginTime = time;
    model.lrc = lrc;
    
    return model;
}

- (NSString *)description
{
    return
    [NSString stringWithFormat:
     @"time:%.2lf lrc:%@", _beginTime, _lrc];
}






@end


