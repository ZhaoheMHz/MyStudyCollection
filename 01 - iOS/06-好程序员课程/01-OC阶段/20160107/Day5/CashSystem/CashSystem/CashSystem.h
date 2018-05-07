//
//  CashSystem.h
//  CashSystem
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CashSystem : NSObject

@property (nonatomic, strong, readonly) NSDictionary *allGoods;

/** 获取收银系统的单例 */
+ (instancetype)defaultSystem;

/**
 从JSON文件中读取商品
 @param filePath 文件路径
 @returns 是否读取成功
 */
- (BOOL)readGoodsDataFromFile:(NSString *)filePath;

/**
 添加购买的商品
 @param name 商品名称
 @param count 购买商品数量
 @returns 添加购买商品是否成功
 */
- (BOOL)addGoodsWithName:(NSString *)name count:(NSUInteger)count;
- (BOOL)removeGoodsWithName:(NSString *)name count:(NSUInteger)count;
- (BOOL)removeGoodsWithName:(NSString *)name;

/** 结算 */
- (void)computeTotalPrice;

// 收银找零



@end
