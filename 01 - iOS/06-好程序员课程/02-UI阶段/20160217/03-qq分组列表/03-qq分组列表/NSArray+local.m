//
//  NSArray+local.m
//  03-qq分组列表
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "NSArray+local.h"

@implementation NSArray (local)

- (NSString *)descriptionWithLocale:(id)locale
{
    
    NSMutableString * string = [NSMutableString string];
    
    
    for(id obj in self)
    {
        NSString * desc = [obj description];
        [string appendFormat:@"\t%@",desc];
    }
    
    return string;
}

@end
