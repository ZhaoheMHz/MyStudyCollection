//
//  GPHeaderView.h
//  03-qq分组列表
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPGroup.h"
@class GPHeaderView;


@protocol GPHeaderViewDelegate <NSObject>

-(void)headerView:(GPHeaderView *)headerView Status:(BOOL)expand;

@end

@interface GPHeaderView : UITableViewHeaderFooterView


@property(nonatomic,weak)id<GPHeaderViewDelegate>delegate;

@property(nonatomic,strong)GPGroup * group;

+(id)headerViewWithTableView:(UITableView *)tableView;

@end
