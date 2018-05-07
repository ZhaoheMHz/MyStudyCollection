//
//  GPNews.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPNews.h"

@implementation GPNews

+ (id)newsWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (id)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"category %@,title = %@", _category,_title];
}

@end
