//
//  GPGroup.h
//  01-简单通讯录
//
//  Created by 哲 肖 on 16/2/23.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPGroup : NSObject

@property (nonatomic, copy)NSArray * names;
@property (nonatomic, copy)NSString * title;

+(id)groupWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
