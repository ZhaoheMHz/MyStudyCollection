//
//  GPStatuses.h
//  01-微博图文
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GPStatuses : NSObject

/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * picture;

@property(nonatomic,copy)NSString * text;

@property(nonatomic,copy)NSString * icon;

@property(nonatomic,copy)NSString * name;

@property(nonatomic,assign)BOOL vip;

//把cell中子控件,frame值的计算,迁移到模型中
@property (nonatomic,assign)CGRect iconImageViewFrame;
@property (nonatomic,assign)CGRect nameLabelFrame;
@property (nonatomic,assign)CGRect vipFrame;
@property (nonatomic,assign)CGRect contentTextLabelFrame;
@property (nonatomic,assign)CGRect pictureImageViewFrame;

@property (nonatomic,assign)CGFloat rowHeight;

+(id)statusesWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
