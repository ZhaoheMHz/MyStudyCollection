//
//  Person.m
//  Day8-Block中的循环引用
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
    NSLog(@"%@被销毁", _name);
}

- (void)buyTicketTo:(NSString *)somewhere from:(NSString *)from
{
    NSLog(@"%@买了一张从\"%@\"-\"%@\"的车票",
          _name, from, somewhere);
}



@end


