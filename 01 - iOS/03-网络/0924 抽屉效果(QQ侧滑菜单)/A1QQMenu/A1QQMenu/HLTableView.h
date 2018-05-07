//
//  HLTableView.h
//  A1QQMenu
//
//  Created by 赵赤赤 on 15/9/24.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLTableView : UITableView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSArray *dataArr;
@property (nonatomic, assign) id target;
@property (nonatomic, assign) SEL selector;

// 从外部接收一个数组,作为自己的数据源
// 同时记录一个对象和一个选择器(方法)
- (void)configWithArray:(NSArray *)dataArr target:(id)target selctor:(SEL)selector;



@end
