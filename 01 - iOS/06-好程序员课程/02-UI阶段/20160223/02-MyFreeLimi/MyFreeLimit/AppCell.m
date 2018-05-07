//
//  AppCell.m
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "AppCell.h"

#import "UIView+QFExt.h"

@implementation AppCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        UIView *view = [self createCellView];
        [self addSubview:view];

    }
    return self;
}

-(UIView *)createCellView
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    
    //背景图片
    //注意: 此处设置的话, 最后还是需要在cellForIndexPath中刷新
    /*
    static int index=0;
    index++;
    NSString *backImageFile = [NSString stringWithFormat:@"cate_list_bg%d.png",index%2+1];
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:backImageFile]];
    */
    
    //应用图标
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 10, 60, 60)];
    //_iconImage.backgroundColor = [UIColor redColor];
    [_iconImageView makeCorner:10];
    [view addSubview:_iconImageView];
    
    //名字标签
    _nameLabel  = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 320-120, 21)];
    _nameLabel.text = @"测试程序";
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.font = [UIFont boldSystemFontOfSize:16];

    [view addSubview:_nameLabel];
    
    //价格标签
    _priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(320-100, 31, 60, 20)];
    _priceLabel.text = @"￥6.0";
    _priceLabel.textAlignment  = NSTextAlignmentCenter;
    _priceLabel.backgroundColor = [UIColor clearColor];
    [view addSubview:_priceLabel];
    
    //分类标签
    _categoryLabel = [[UILabel alloc] initWithFrame:CGRectMake(320-100, 55, 60, 20)];
    _categoryLabel.text = @"￥6.0";
    _categoryLabel.textAlignment  = NSTextAlignmentCenter;
    _categoryLabel.backgroundColor = [UIColor clearColor];
    [view addSubview:_categoryLabel];
    
    
    //线
    UIView *lineView = [[UIView alloc] init];
    lineView.frame = CGRectMake(0, 0, _priceLabel.bounds.size.width, 2);
    lineView.center = CGPointMake(_priceLabel.bounds.size.width/2, _priceLabel.bounds.size.height/2);
    lineView.backgroundColor = [UIColor grayColor];
    [_priceLabel addSubview:lineView];
    
    
    //分享-收藏-下载
    _sharesLabel = [[UILabel alloc] initWithFrame:CGRectMake(14, 75, 90, 20)];
    _sharesLabel.text = @"分享: ?";
    _sharesLabel.backgroundColor = [UIColor clearColor];
    [view addSubview:_sharesLabel];
    
    _favoritesLabel = [[UILabel alloc] initWithFrame:CGRectMake(90, 75, 90, 20)];
    _favoritesLabel.text = @"收藏: ?";
    _favoritesLabel.backgroundColor = [UIColor clearColor];
    [view addSubview:_favoritesLabel];
    
    _downloadsLabel = [[UILabel alloc] initWithFrame:CGRectMake(175, 75, 90, 20)];
    _downloadsLabel.text = @"下载: ?";
    _downloadsLabel.backgroundColor = [UIColor clearColor];
    [view addSubview:_downloadsLabel];
    
    
    //设置评级
    _starView = [[StarView alloc] initWithFrame:CGRectMake(80, 40, 65, 23)];
    [_starView setStar:5];
    [view addSubview:_starView];
    
    
    return view;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
