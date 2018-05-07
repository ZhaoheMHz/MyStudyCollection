//
//  Client.m
//  Day5-客户端与服务器
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Client.h"
#import "Server.h"

@implementation Client

- (void)requestDataOfType:(NSString *)type withCallback:(void (^)(BOOL, id))callback
{
    // 1.获取Server单例
    Server *server = [Server defaultServer];
    
    // 2.返回数据
    id data = [server respondesDataOfType:type];
    
    // 3.回调Block
    if (!data) {
        callback(NO, nil);
    }
    else {
        callback(YES, data);
    }
}




@end


