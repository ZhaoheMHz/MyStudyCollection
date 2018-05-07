//
//  GPSubject.h
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPSubject : NSObject

/**
 *  title
 */
@property(nonatomic,copy)NSString * title;

@property(nonatomic,copy)NSString * cardNumber;
/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * note;
/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * icon;

+(id)subjectWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
