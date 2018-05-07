//
//  PersonProtocol.h
//  Day4-03协议
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

// 协议
// 1.协议就是一组方法的声明
// 2.协议是用来规范接口的
// 3.遵守协议的类，就要实现协议中的方法
// 协议结构：@protocol 协议名称 <父协议>
@protocol PersonProtocol <NSObject>

@required // 必须实现的方法 (默认属性)
- (void)eat;
- (void)speak;

@optional // 可选实现
- (void)work;

@end






