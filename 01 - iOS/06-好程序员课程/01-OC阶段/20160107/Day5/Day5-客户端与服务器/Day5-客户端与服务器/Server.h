//
//  Server.h
//  Day5-客户端与服务器
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Server : NSObject

// 单例设计模式：在程序的生命周期中，只存在一个该类的对象
// 这个就是获取单例的方法
+ (instancetype)defaultServer;

// 返回数据
- (id)respondesDataOfType:(NSString *)type;

@end







