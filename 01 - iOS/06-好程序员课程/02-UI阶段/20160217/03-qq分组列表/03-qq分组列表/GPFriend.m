//
//  GPFriend.m
//  01-qq分组简单
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "GPFriend.h"

@implementation GPFriend

+(id)friendWithDict:(NSDictionary *)dict
{
    return [self objectWithDict:dict];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"name = %@,message = %@,icon = %@", _name,_message,_icon];
}

@end
