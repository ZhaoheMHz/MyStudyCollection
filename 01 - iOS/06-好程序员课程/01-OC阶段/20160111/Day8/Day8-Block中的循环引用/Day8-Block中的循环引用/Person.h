//
//  Person.h
//  Day8-Block中的循环引用
//
//  Created by ZhangChao on 16/1/11.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *name;

- (void)buyTicketTo:(NSString *)somewhere from:(NSString *)from;

@end





