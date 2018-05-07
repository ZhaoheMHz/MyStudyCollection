//
//  Person.m
//  Day7-01深浅拷贝
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)dealloc
{
//    [_name release];
//    _name =  nil; // 为了防止僵尸对象的访问
    
    // 在释放对象之后，把对象指针立即置为nil
    self.name = nil;
    
    [super dealloc];
}

//- (void)setName:(NSString *)name
//{
//    if (_name != name) {
//        [_name release];
//        
//        // self.name = [name retain] 错误
//        _name = [name retain];
//    }
//}

- (void)eat
{
    NSLog(@"%@正在吃饭", _name);
}

@end





