//
//  LrcParser.h
//  LrcParser
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LrcParser : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *author;

// 读取文件，并进行数据解析
- (BOOL)readFileAtPath:(NSString *)path;

// 返回time对应的歌词
- (NSString *)lrcAtTime:(float)time;

+ (void)test;

@end



