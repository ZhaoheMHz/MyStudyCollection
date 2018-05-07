//
//  Promotion.m
//  01-xml文件解析
//
//  Created by 哲 肖 on 15/10/29.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "Promotion.h"

@implementation Promotion

+ (id)promotionWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (id)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        self.ID = dict[@"id"];
        self.name = dict[@"name"];
        self.starttime = dict[@"starttime"];
        
    }
    return self;
}

@end
