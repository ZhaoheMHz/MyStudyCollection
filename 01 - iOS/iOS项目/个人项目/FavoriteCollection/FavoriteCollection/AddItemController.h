//
//  AddItemController.h
//  FavoriteCollection
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model.h"

@protocol AddItemDelegate <NSObject>

- (void)addItemWithModel:(Model *)model;
- (void)setIsRefresh:(BOOL)isRefresh;

@end

@interface AddItemController : UIViewController

// 跳转添加界面时,为添加的项目指定分类
@property (nonatomic, copy) NSString *category;
@property (nonatomic, strong) Model *model;
@property (nonatomic, assign) id<AddItemDelegate> delegate;
@property (nonatomic, assign) BOOL isSearch;

@end
