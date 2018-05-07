//
//  GPNewsFactory.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPNewsFactory.h"

#import "GPLarge.h"
#import "GPList.h"
#import "GPApp.h"
#import "GPOrigin.h"

@implementation GPNewsFactory

+(GPNews *)newsWithDict:(NSDictionary *)dict
{
    GPNews * news = nil;
    NSString * category = dict[@"category"];
    
    if([category isEqualToString:@"large"])
    {
        news = [GPLarge largeWithDict:dict];
//        news.rowHeight = 150;
    }
    else if ([category isEqualToString:@"list"])
    {
        news = [GPList newsWithDict:dict];
        news.rowHeight = 130;
        
    }
    else if ([category isEqualToString:@"origin"])
    {
        news = [GPOrigin newsWithDict:dict];
        news.rowHeight = 80;
    }
    else if ([category isEqualToString:@"app"])
    {
        news = [GPApp newsWithDict:dict];
        news.rowHeight = 83;
    }
    
    return news;
}

@end
