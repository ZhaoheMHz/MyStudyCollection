//
//  DatabaseManager.h
//  FavoriteCollection
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Model.h"


@interface DatabaseManager : NSObject

+ (instancetype)defaultManager;
- (BOOL)insertWithModel:(Model *)model;
- (NSArray *)selectSetionWith:(NSString *)type andSort:(NSString *)sort;
- (BOOL)updateWithModel:(Model *)model itemWithNameUpdateBefore:(NSString *)nameUpdateBefore;
- (BOOL)deleteWithModel:(Model *)model;

@end
