//
//  GPGroup.h
//  03-qq分组列表
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+KVC.h"

@interface GPGroup : NSObject


@property(nonatomic,assign)BOOL  expand;

/**
 *  存储的是Friend模型
 */
@property(nonatomic,strong)NSArray * friends;

@property(nonatomic,copy)NSString *online;

/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * title;



+(id)groupWithDict:(NSDictionary *)dict;

@end
