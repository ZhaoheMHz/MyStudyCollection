//
//  TopicCell.h
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppShowView.h"

@interface TopicCell : UITableViewCell
@property (retain) UILabel *titleLabel;
@property (retain) UIImageView *imgView;
//右边显示4个应用
@property (retain) NSMutableArray *appShowViewArray;

@property (retain) UIImageView *imgDescView;
@property (retain) UILabel *descLabel;
@end
