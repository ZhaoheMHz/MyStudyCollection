//
//  Person.h
//  Day4-03协议
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PersonProtocol.h"

@interface Person : NSObject
<PersonProtocol> // 遵守协议
// 协议中声明的方法，类中无需重复声明


@end







