//
//  GPFriend.h
//  02-好友
//
//  Created by 哲 肖 on 16/2/17.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPFriend : NSObject

/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * icon;

/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * message;

/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * name;

+(id)friendWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
