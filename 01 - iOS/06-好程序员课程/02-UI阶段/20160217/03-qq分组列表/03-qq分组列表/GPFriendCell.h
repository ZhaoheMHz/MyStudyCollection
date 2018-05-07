//
//  GPFriendCell.h
//  03-qq分组列表
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPFriend.h"

@interface GPFriendCell : UITableViewCell

@property(nonatomic,strong)GPFriend * myFriend;

+(id)friendCellWithTableView:(UITableView *)tableView;

@end
