//
//  AppCell.h
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "StarView.h"

@interface AppCell : UITableViewCell
@property (nonatomic,retain) UIImageView *iconImageView;
@property (nonatomic,retain) UILabel *nameLabel;
@property (nonatomic,retain) UILabel *priceLabel;
@property (nonatomic,retain) UILabel *categoryLabel;

@property (nonatomic,retain) UILabel *sharesLabel;
@property (nonatomic,retain) UILabel *favoritesLabel;
@property (nonatomic,retain) UILabel *downloadsLabel;

@property (nonatomic,retain) StarView *starView;

@end
