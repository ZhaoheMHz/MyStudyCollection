//
//  main.m
//  Day9-02NSUserDefaults
//
//  Created by ZhangChao on 16/1/12.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 获取单例
        // 工程创建好之后，就会生成一个自己的偏好配置文件
        // 不可以直接存储自定义对象数据
        // 数组，字符串，字典，基本数据类型 可以直接通过方法存入
        NSUserDefaults *defaults =
        [NSUserDefaults standardUserDefaults];
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSLog(@"path:%@", bundle.bundlePath);
        
        // 1.写数据
        NSString *string = @"1000phome.com";
        [defaults setObject:string
                     forKey:@"1000phone"];
        
        // 立即同步数据到文件中
        [defaults synchronize];
        
        // 2.取数据
        string =
        [defaults objectForKey:@"1000phone"];
        
        // 3.移除某个key-value
//        [defaults removeObjectForKey:@"1000phone"];
        string =
        [defaults objectForKey:@"1000phone"];
        NSLog(@"%@", string);
        
        // 4.重置文件（清除缓存）
//        [NSUserDefaults resetStandardUserDefaults];
        
        // 5.打印所有键值对
//        NSLog(@"%@", defaults.dictionaryRepresentation);
        
        NSDictionary *dict =
        defaults.dictionaryRepresentation;
        
        [dict writeToFile:@"/Users/chao/Desktop/iOS-BJ1507/OC阶段/Day9/defaults.plist" atomically:YES];
    }
    return 0;
}



