//
//  Person.h
//  Day9-03归档
//
//  Created by ZhangChao on 16/1/12.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

// 归档的过程实际上就是数据编码的过程
// 解档的过程实际上就是反编码的过程
// 编码: person对象--->NSData对象

// 要进行归档必须遵守NSCoding协议
// 先对属性一一进行编码，在对Person对象编码
@interface Person : NSObject
<NSCoding>

@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, copy) NSString *sex;

@end




