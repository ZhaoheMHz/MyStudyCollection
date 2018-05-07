//
//  Person.m
//  Day1-第一个OC程序
//
//  Created by ZhangChao on 15/12/29.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)eat
{

}

- (void)sleep
{

}

- (void)work
{

}

- (void)buyPhone:(Phone *)phone
{
    NSLog(@"买手机");
    
    _phone = phone;
    NSLog(@"手机参数: %@", _phone);
}





@end
