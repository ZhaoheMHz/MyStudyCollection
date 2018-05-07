//
//  Client.h
//  Day5-客户端与服务器
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Client : NSObject

// 请求数据
// 通过block完成值的传递
- (void)requestDataOfType:(NSString *)type withCallback:(void (^)(BOOL success, id data))callback;


@end







