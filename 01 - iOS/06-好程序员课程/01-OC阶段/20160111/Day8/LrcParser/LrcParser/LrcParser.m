//
//  LrcParser.m
//  LrcParser
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "LrcParser.h"
#import "LrcModel.h"

#define kFilePath @"/Users/chao/Desktop/iOS-BJ1507/OC阶段/Day8/歌词解析.txt"

@interface LrcParser ()

// 用来存放模型对象
@property (nonatomic, strong) NSMutableArray *lrcItems;

@end

@implementation LrcParser

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        _lrcItems = [NSMutableArray array];
    }
    
    return self;
}

- (BOOL)readFileAtPath:(NSString *)path
{
    NSError *error = nil;
    
    NSString *lrcData = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:&error];
    
    if (!error) {
        [self parserLrcDataFromString:lrcData];
        return YES;
    }
    else {
        NSLog(@"文件读取失败，reason: %@", error);
        return NO;
    }
}

// 2.解析歌词
//[ti:传奇]
//[ar:王菲]
//[00:03.50]传奇
//[00:19.10]作词：刘兵 作曲：李健
//[00:20.60]演唱：王菲
//[00:26.60]
//[04:40.75][02:39.90][00:36.25]只是因为在人群中多看了你一眼
- (void)parserLrcDataFromString:(NSString *)string
{
    NSArray *rowArray =
    [string componentsSeparatedByString:@"\n"];
    
    // 遍历数组，区分信息行 和 歌词行
    for (NSString *rowString in rowArray) {
        if (![self isLrcRowWithString:rowString])
        {
            [self parseSongInfo:rowString];
        }
        else {
            [self parseLrc:rowString];
        }
    }
}

// 3.判断是否是歌词所在行
- (BOOL)isLrcRowWithString:(NSString *)rowString
{
    if ([rowString hasPrefix:@"[0"]) {
        return YES;
    }
    else {
        return NO;
    }
}

// 解析歌曲信息行
- (void)parseSongInfo:(NSString *)rowString
{
    NSArray *tempArray = [rowString componentsSeparatedByString:@":"];
    NSString *lastString =
    tempArray.lastObject;
    
    // [ti  传奇]
    if ([rowString hasPrefix:@"[ti"]) {
        _title =
        [lastString substringToIndex:lastString.length - 1];
    }
    else if ([rowString hasPrefix:@"[ar"]) {
        _author =
        [lastString substringToIndex:lastString.length - 1];
    }
}

// 解析歌词行
//[04:40.75
//[02:39.90
//[00:36.25
//只是因为在人群中多看了你一眼
- (void)parseLrc:(NSString *)rowString
{
    NSArray *tempArray = [rowString componentsSeparatedByString:@"]"];
    
    for (NSInteger i = 0; i < tempArray.count - 1; i++)
    {
        LrcModel *model =
        [LrcModel modelWithTime:[self floatValueOfTimeString:tempArray[i]] lrc:tempArray.lastObject];
        
        [_lrcItems addObject:model];
    }
}

// 把时间字符串转换成秒
// [04:40.75
- (float)floatValueOfTimeString:(NSString *)timeString
{
    // 04:40.75
    NSString *realTime =
    [timeString substringFromIndex:1];
    
    // 04
    // 40.75
    NSArray *tempArray =
    [realTime componentsSeparatedByString:@":"];
    
    return
    [tempArray.firstObject intValue] * 60 +
    [tempArray.lastObject floatValue];
}

// 5
// 3.5 cccccccc
// 10 aaaaaaaa
// 15 bbbbb
// 120 xxxxxxx
// 200

// 比最小的时间小，显示歌曲信息
// 比最大的时间大，显示歌曲结束
- (NSString *)lrcAtTime:(float)time
{
    NSSortDescriptor *desc =
    [NSSortDescriptor
     sortDescriptorWithKey:@"beginTime"
     ascending:YES];
    
    // 按时间由小到大排序
    [_lrcItems sortUsingDescriptors:@[desc]];
    
    LrcModel *firstModel = _lrcItems.firstObject;
    float minTime = firstModel.beginTime;
    
    LrcModel *lastModel = _lrcItems.lastObject;
    float maxTime = lastModel.beginTime;
    
    if (time < minTime) {
        return
        [NSString stringWithFormat:
         @"歌曲：%@  演唱者：%@", _title, _author];
    }
    
    if (time > maxTime) {
        return @"歌曲结束";
    }
    
    for (NSInteger i = 0; i < _lrcItems.count; i++) {
        LrcModel *model = _lrcItems[i];
        
//        if (time == model.beginTime) {
//            return model.lrc;
//        }
        if (time < model.beginTime) {
            LrcModel *premodel = _lrcItems[i - 1];
            return premodel.lrc;
        }
    }
    
    return nil;
}


+ (void)test
{
    LrcParser *parser = [[LrcParser alloc] init];
    
    [parser readFileAtPath:kFilePath];
    
    float processor = 0;
    NSString *preLrc = nil;
    
    while (processor < 300) {
        NSString *lrc = [parser lrcAtTime:processor];
        if (![lrc isEqualToString:preLrc]) {
            printf("%s\n",
                   [lrc cStringUsingEncoding:NSUTF8StringEncoding]);
        }
        
        sleep(1);
        processor += 5;
        preLrc = lrc;
    }
}

@end
