//
//  GPFriend.m
//  02-好友
//
//  Created by 哲 肖 on 16/2/17.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPFriend.h"

@implementation GPFriend

+(id)friendWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
-(id)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"icon = %@,message = %@,name = %@", _icon,_message,_name];
}

@end
