//
//  AppShowView.h
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "StarView.h"
#import "AppShowView.h"
#import "UIView+QFExt.h"

@interface AppShowView : UIView
@property (retain) UIImageView *iconImageView;
@property (retain) UILabel *titleLabel;
@property (retain) UILabel *commentLabel;
@property (retain) UILabel *downLabel;
@property (retain) StarView *starView;
@end
