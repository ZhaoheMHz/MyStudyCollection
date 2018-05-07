//
//  GPApp.h
//  04-爱限免程序
//
//  Created by 哲 肖 on 16/2/23.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPApp : NSObject

/**
 *  图片的网络下载地址
 */
@property(nonatomic,copy)NSString * iconUrl;
@property(nonatomic,copy)NSString * name;

+(id)appWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
