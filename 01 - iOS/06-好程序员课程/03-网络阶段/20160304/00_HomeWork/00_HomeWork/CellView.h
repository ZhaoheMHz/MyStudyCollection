//
//  CellView.h
//  00_HomeWork
//
//  Created by baoxu on 15/11/27.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CellView : UITableViewCell

@property(nonatomic,strong)UILabel *titleLabel;
@property(nonatomic,strong)UIImageView *cellImageView;
@property(nonatomic,strong)UIImage *cellImage;
@property(nonatomic,strong)UIProgressView *progressView;
@property(nonatomic,strong)UIImage *defaultImage;

@end
