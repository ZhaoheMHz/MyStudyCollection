//
//  Shop.m
//  01-xml文件解析
//
//  Created by 哲 肖 on 15/10/29.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "Shop.h"
#import "Promotion.h"

@implementation Shop

+ (id)shopWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
- (id)initWithDict:(NSDictionary *)dict
{
    if(self = [super init])
    {
        self.result = [dict[@"result"] intValue];
        self.cuttotal = [dict[@"cuttotal"] intValue];
        self.total = [dict[@"total"] intValue];
        self.shareprefix = dict[@"shareprefix"];
        self.buyprefix = dict[@"buyprefix"];
        
        NSArray * listArray  = dict[@"list"];
        NSMutableArray * objs = [NSMutableArray array];
        for(NSDictionary * listDict in listArray )
        {
            Promotion * prom = [Promotion promotionWithDict:listDict];
            [objs addObject:prom];
            
        }
        self.list = objs;
    }
    return self;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"shareprefix = %@,list = %@", _shareprefix,_list];
}

@end
