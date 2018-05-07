//
//  CategoryModel.h
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject
@property (copy) NSString *category_id;
@property (copy) NSString *category_count;
@property (copy) NSString *free;
@property (copy) NSString *same;
@property (copy) NSString *down;
@property (copy) NSString *limited;
@property (copy) NSString *up;
@property (copy) NSString *category_name;
@property (copy) NSString *category_cname;
@property (copy) NSString *lessenPrice;
@end
