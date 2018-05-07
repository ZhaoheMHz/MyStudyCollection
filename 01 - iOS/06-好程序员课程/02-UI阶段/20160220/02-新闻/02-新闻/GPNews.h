//
//  GPNews.h
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GPNews : NSObject

//1.large: category,picture,source,time,title
/**
 *  代表不同的分类样式,category是给我们程序用作区分不同类型数据用的字段
 */
@property(nonatomic,copy)NSString * category;
@property(nonatomic,copy)NSString * title;

@property(nonatomic,assign)CGFloat rowHeight;

+ (id)newsWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
