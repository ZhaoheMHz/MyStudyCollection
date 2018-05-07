//
//  Person.m
//  Day9-03归档
//
//  Created by ZhangChao on 16/1/12.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Person.h"

NSString *const nameKey = @"name";

@implementation Person

// 解档时，系统会使用该方法来初始化对象
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if (self) {
        _name =
        [aDecoder decodeObjectForKey:nameKey];
        _age =
        [aDecoder decodeIntegerForKey:@"age"];
        _sex =
        [aDecoder decodeObjectForKey:@"sex"];
    }
    
    return self;
}

// 归档时，系统会自动调用该方法
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    // 实际开发中，key一般会使用 全局字符串常量，或宏定义
    [aCoder encodeObject:_name forKey:nameKey];
    [aCoder encodeInteger:_age forKey:@"age"];
    [aCoder encodeObject:_sex forKey:@"sex"];
}




@end




