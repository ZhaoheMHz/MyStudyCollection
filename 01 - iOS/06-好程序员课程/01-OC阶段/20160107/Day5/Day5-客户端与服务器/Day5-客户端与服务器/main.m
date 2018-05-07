//
//  main.m
//  Day5-客户端与服务器
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Client.h"

// 客户端: 请求数据
// 服务端: 存储数据，返回数据
int main(int argc, const char * argv[])
{
    @autoreleasepool {
        Client *client = [[Client alloc] init];
        
        [client requestDataOfType:@"Dictionary" withCallback:^(BOOL success, id data)
        {
            // 数据的传递，是通过Block形参完成的
            if (!success) {
                NSLog(@"服务器没有指定类型的数据");
            }
            else {
                NSLog(@"data: %@", data);
            }
        }];
    }
    return 0;
}







