//
//  GPADS.h
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPADS : NSObject

/**
 *  广告图片的名称
 */
@property(nonatomic,copy)NSString * name;

/**
 *  广告图片的资源名称
 */
@property(nonatomic,copy)NSString * icon;

+ (id)adsWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
