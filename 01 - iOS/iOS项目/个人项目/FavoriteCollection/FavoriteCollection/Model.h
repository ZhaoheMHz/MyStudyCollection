//
//  Model.h
//  FavoriteCollection
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *info;
@property (nonatomic, copy) NSString *star;
@property (nonatomic, strong) NSString *commitDate;
@property (nonatomic, copy) NSString *category;

@end
