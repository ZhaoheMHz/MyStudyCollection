//
//  GPStatusesCell.h
//  01-微博图文
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPStatuses.h"

@interface GPStatusesCell : UITableViewCell

@property (nonatomic,assign) CGFloat rowHeight;

@property (nonatomic, strong)GPStatuses * statuses;

+(id)statusesCellWithTableView:(UITableView *)tableView;

@end
