//
//  CandouAppCell.h
//  MyFreeLimit
//
//  Created by mac on 14-4-12.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "StarView.h"
#import "UIView+QFExt.h"

@interface CandouAppCell : UITableViewCell
@property (nonatomic,retain) UIImageView *iconImageView;
@property (nonatomic,retain) UILabel *nameLabel;
@property (nonatomic,retain) UILabel *descriptionLabel;


@property (nonatomic,retain) StarView *starView;
@end
