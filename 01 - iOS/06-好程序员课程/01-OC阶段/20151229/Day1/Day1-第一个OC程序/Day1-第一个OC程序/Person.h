//
//  Person.h
//  Day1-第一个OC程序
//
//  Created by ZhangChao on 15/12/29.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"

@interface Person : NSObject
{
    @public
    NSString *_name;
    NSInteger _age;
    NSString *_sex;
    Phone *_phone;
}

- (void)eat;
- (void)sleep;
- (void)work;
- (void)buyPhone:(Phone *)phone;

@end







