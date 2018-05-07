//
//  User.m
//  Day9-05JSON
//
//  Created by ZhangChao on 16/1/12.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "User.h"

@interface User ()

//@property (nonatomic, copy) NSString *name;

@end

@implementation User
{
//    NSString *name;
//    NSString *_name;
    NSString *age;
}

// KVC 找不到对应属性时，回去调用这个方法
// 系统默认实现，会抛出一个异常
// 通过重写该方法，可以让程序正常执行
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@", key);
    NSLog(@"%@", value);
    
    // 如何让name--age建立对应关系
    if ([key isEqualToString:@"name"]) {
        age = value;
    }
}

//- (NSString *)description
//{
//    return
//    [NSString stringWithFormat:
//     @"name = %@, _name = %@", name, _name];
//}




@end
