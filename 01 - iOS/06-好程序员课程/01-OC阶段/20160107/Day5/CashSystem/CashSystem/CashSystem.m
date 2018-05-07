//
//  CashSystem.m
//  CashSystem
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "CashSystem.h"
#import "GoodsModel.h"

static CashSystem *cashSystem = nil;

@interface CashSystem ()

@property (nonatomic, strong) NSMutableDictionary *addedGoodsDict;

// 解析数据，转换为数据模型，进行保存
- (BOOL)parseGoodsFromDict:(NSDictionary *)goodDict;

@end

@implementation CashSystem

- (instancetype)init
{
    self = [super init];
    
    if (self) {
    }
    
    return self;
}

+ (instancetype)defaultSystem
{
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        cashSystem = [[self alloc] init];
        cashSystem.addedGoodsDict = [NSMutableDictionary dictionary];
    });
    
    return cashSystem;
}

- (BOOL)readGoodsDataFromFile:(NSString *)filePath
{
    // JSON文件中存放的是二进制
    NSData *goodsData = [NSData dataWithContentsOfFile:filePath];
    NSError *error = nil;
    
    if (!goodsData) {
        NSLog(@"读取文件失败, 可能是文件损坏");
        return NO;
    }
    
    // JSON数据的解析
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:goodsData options:NSJSONReadingMutableContainers error:&error];
    
    if (!dict) {
        NSLog(@"解析数据错误，reason: %@", error);
        return NO;
    }
    
    BOOL result = [self parseGoodsFromDict:dict[@"Info"]];
    return result;
}

- (BOOL)parseGoodsFromDict:(NSDictionary *)goodDict
{
    NSMutableDictionary *tempDict = [NSMutableDictionary dictionary];
    
    for (NSString *key in goodDict) {
        GoodsModel *model = [GoodsModel model];
        [model setValuesForKeysWithDictionary:goodDict[key]];
        
        if (model.name.length == 0 ||
            model.price.floatValue <= 0 ||
            model.count <= 0) {
            
            NSLog(@"\n(%@)\n录入数据失败", model);
            continue;
        }
        
        [tempDict setObject:model forKey:key];
    }
    
    if (tempDict.count == 0) {
        NSLog(@"数据解析失败，商品数据有误");
        return NO;
    }
    
    _allGoods = [tempDict copy];
    
    return YES;
}

- (BOOL)addGoodsWithName:(NSString *)name count:(NSUInteger)count
{
    if (!_allGoods[name]) {
        NSLog(@"添加失败，还没有该商品的数据信息");
        return NO;
    }
    
    GoodsModel *model = _allGoods[name];
    if (model.count.integerValue < count) {
        NSLog(@"添加失败，商品库存不足，最多只能购买%d件", (int)model.count.integerValue);
        return NO;
    }
    
    GoodsModel *addedModel = [GoodsModel model];
    addedModel.goodsID = model.goodsID;
    addedModel.price = [NSString stringWithFormat:@"%.1f", (float)model.price.floatValue];
    addedModel.name = name;
    addedModel.count = [NSString stringWithFormat:@"%d", (int)count];
    
    [_addedGoodsDict setObject:addedModel forKey:name];
    
    return YES;
}

- (BOOL)removeGoodsWithName:(NSString *)name count:(NSUInteger)count
{
    if ([_addedGoodsDict.allKeys containsObject:name] == NO) {
        NSLog(@"移除失败，还没有添加 %@", name);
        return NO;
    }
    
    GoodsModel *model = _addedGoodsDict[name];
    if (model.count.integerValue < count) {
        NSLog(@"移除失败，删除的数量超过添加总数");
        return NO;
    }
    
    model.count = [NSString stringWithFormat:@"%d", (int)(model.count.integerValue - count)];
    if (model.count == 0) {
        [_addedGoodsDict removeObjectForKey:name];
    }
    
    return YES;
}

- (BOOL)removeGoodsWithName:(NSString *)name
{
    if ([_addedGoodsDict.allKeys containsObject:name] == NO) {
        NSLog(@"移除失败，还没有添加 %@", name);
        return NO;
    }
    
    [_addedGoodsDict removeObjectForKey:name];
    return YES;
}

- (void)computeTotalPrice
{
    CGFloat totalPrice = 0;
    
    for (NSString *name in _addedGoodsDict) {
        GoodsModel *model = _addedGoodsDict[name];
        totalPrice += [model totalPrice];
    }
    
    NSLog(@"%@ 总价: %.1f", _addedGoodsDict, totalPrice);
    [_addedGoodsDict removeAllObjects];
}

@end
