//
//  GPFriend.h
//  01-qq分组简单
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+KVC.h"

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



@end
