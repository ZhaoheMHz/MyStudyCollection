//
//  GoodsModel.h
//  CashSystem
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GoodsModel : NSObject

@property (nonatomic, copy) NSString *goodsID;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *count;

+ (instancetype)model;
- (NSInteger)totalPrice;

@end



