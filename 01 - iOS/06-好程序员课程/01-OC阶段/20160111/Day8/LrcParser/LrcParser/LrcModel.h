//
//  LrcModel.h
//  LrcParser
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LrcModel : NSObject

// 歌词出现的时间，以秒为单位计数
@property (nonatomic, assign) float beginTime;
@property (nonatomic, copy) NSString *lrc;

+ (instancetype)modelWithTime:(float)time
                          lrc:(NSString *)lrc;

@end





