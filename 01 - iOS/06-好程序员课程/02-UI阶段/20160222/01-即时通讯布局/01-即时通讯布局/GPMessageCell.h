//
//  GPMessageCell.h
//  01-即时通讯布局
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPMessage.h"

@interface GPMessageCell : UITableViewCell

@property (nonatomic, strong)GPMessage * message;

+(id)messageCellWithTableView:(UITableView *)tableView;

@end
