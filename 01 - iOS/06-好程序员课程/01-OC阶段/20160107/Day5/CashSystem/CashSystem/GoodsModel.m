//
//  GoodsModel.m
//  CashSystem
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "GoodsModel.h"

@implementation GoodsModel

+ (instancetype)model
{
    GoodsModel *model = [[self alloc] init];
    return model;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        _goodsID = value;
    }
}

- (NSInteger)totalPrice
{
    return _count.integerValue * _price.floatValue;
}

- (NSString *)description
{
    return
    [NSString stringWithFormat:@"name: %@, id: %@, price: %@, count: %@", _name, _goodsID, _price, _count];
}

@end
