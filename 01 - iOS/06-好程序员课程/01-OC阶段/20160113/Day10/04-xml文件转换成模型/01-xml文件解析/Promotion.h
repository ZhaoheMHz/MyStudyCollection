//
//  Promotion.h
//  01-xml文件解析
//
//  Created by 哲 肖 on 15/10/29.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Promotion : NSObject

/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * ID;

/**
 *
 */
@property(nonatomic,copy)NSString * name;

/**
 *  starttime
 */
@property(nonatomic,copy)NSString * starttime;

+ (id)promotionWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;


@end
