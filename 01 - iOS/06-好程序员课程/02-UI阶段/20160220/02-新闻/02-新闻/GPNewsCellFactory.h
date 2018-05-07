//
//  GPNewsCellFactory.h
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GPBaseCell.h"

@interface GPNewsCellFactory : NSObject

/*
 
 NSNumber 
 NSURLSession
 
 */
+(GPBaseCell *)cellWithTableView:(UITableView *)tableView news:(GPNews *)news;

@end
