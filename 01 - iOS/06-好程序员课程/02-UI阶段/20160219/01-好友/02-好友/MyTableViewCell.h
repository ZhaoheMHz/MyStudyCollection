//
//  MyTableViewCell.h
//  02-好友
//
//  Created by 哲 肖 on 16/2/17.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPFriend.h"

@interface MyTableViewCell : UITableViewCell

@property (nonatomic, weak) UIImageView * icon;

@property (nonatomic, weak) UILabel * titleNameLabel;

@property (nonatomic, strong)GPFriend * Friend;


+ (id)myTableViewCellWithTableView:(UITableView *)tableView;

@end
