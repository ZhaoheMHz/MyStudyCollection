//
//  GPGroup.m
//  03-qq分组列表
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "GPGroup.h"
#import "GPFriend.h"

@implementation GPGroup

+(id)groupWithDict:(NSDictionary *)dict
{
    return [self objectWithDict:dict];
}

- (id)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
        
        //特殊处理
        NSMutableArray * objs = [NSMutableArray array];
        for(NSDictionary * tmp in self.friends)
        {
            GPFriend * friend = [GPFriend friendWithDict:tmp];
            [objs addObject:friend];
        }
        
        self.friends = objs;
        
        
    }
    return self;
}

- (NSString *)description{
    return [NSString stringWithFormat:@"friends %@",_friends];
}

@end
