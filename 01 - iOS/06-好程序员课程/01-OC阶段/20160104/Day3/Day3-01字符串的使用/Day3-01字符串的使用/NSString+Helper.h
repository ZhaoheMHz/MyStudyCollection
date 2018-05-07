//
//  NSString+Helper.h
//  Day3-01字符串的使用
//
//  Created by ZhangChao on 16/1/4.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

// Category：要扩展的类 (类别名称)
// 1.使用类别可以在不破坏原有类的基础上进行功能的扩充
// 2.类别实际上可以理解为就是一组扩展的接口
@interface NSString (Helper)

- (NSString *)reverse;
+ (NSString *)reverseString:(NSString *)aString;

@end






