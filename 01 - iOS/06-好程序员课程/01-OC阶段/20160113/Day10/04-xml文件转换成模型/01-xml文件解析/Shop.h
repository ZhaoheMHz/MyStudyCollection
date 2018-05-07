//
//  Shop.h
//  01-xml文件解析
//
//  Created by 哲 肖 on 15/10/29.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Shop : NSObject

@property(nonatomic,assign)int result;
@property(nonatomic,assign)int cuttotal;
@property(nonatomic,assign)int total;
/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * shareprefix;

/**
 *  <#Description#>
 */
@property(nonatomic,copy)NSString * buyprefix;

/**
 *  <#Description#>
 */
@property(nonatomic,strong)NSArray * list;




+ (id)shopWithDict:(NSDictionary *)dict;
- (id)initWithDict:(NSDictionary *)dict;

@end
