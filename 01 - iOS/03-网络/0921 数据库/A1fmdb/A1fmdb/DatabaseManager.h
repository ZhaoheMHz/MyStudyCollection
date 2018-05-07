//
//  DatabaseManager.h
//  A1fmdb
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface DatabaseManager : NSObject

// 获取数据管理者的单例对象
+ (instancetype)defaultManager;

// 插入一条数据
- (void)insertWithModel:(Person *)ps;

// 将id为pId的数据修改成ps里记录的数据
- (void)updateWithModel:(Person *)ps forId:(int)pId;

// 从数据库中查询所有的数据
- (NSArray *)selectAllModel;

@end
