//
//  Server.m
//  Day5-客户端与服务器
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Server.h"

@interface Server ()

@property NSString *string;
@property NSArray *array;
@property NSDictionary *dict;

@end

@implementation Server

+ (instancetype)defaultServer
{
    // [Server defaultServer]
    // GCD
    // 静态变量的声明语句只会被执行一次
    static Server *server = nil;
    // 该变量必须是静态的，如果不是，不能保证下面的代码只会被执行一词
    static dispatch_once_t predicate;
    
    // 创建单例
    // 该方法只会被调用一次
    dispatch_once(&predicate, ^{
        server = [[self alloc] init];
    });
    
    return server;
}

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        // 初始化服务器中的数据
        _string = @"我是一个字符串";
        _array = @[@"one", @"two", @"three"];
        _dict = @{@"name": @"Tom",
                  @"age": @20};
    }
    
    return self;
}

- (id)respondesDataOfType:(NSString *)type
{
    if ([type isEqualToString:@"String"]) {
        return _string;
    }
    
    if ([type isEqualToString:@"Array"]) {
        return _array;
    }
    
    if ([type isEqualToString:@"Dictionary"]) {
        return _dict;
    }
    
    return nil;
}



@end


