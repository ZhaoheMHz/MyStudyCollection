//
//  CandouAppCell.m
//  MyFreeLimit
//
//  Created by mac on 14-4-12.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "CandouAppCell.h"

@implementation CandouAppCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self addSubview:[self createCellView]];
    }
    return self;
}


-(UIView *)createCellView
{
    // cell 320X100
    
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 100)];
    
    //背景图片
    static int index=0;
    index++;
    NSString *backImageFile = [NSString stringWithFormat:@"cate_list_bg%d.png",index%2+1];
    view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:backImageFile]];
    
    
    //应用图标
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(14, 10, 60, 60)];
    //_iconImage.backgroundColor = [UIColor redColor];
    [_iconImageView makeCorner:10];
    [view addSubview:_iconImageView];
    
    //名字标签
    _nameLabel  = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 320-120, 21)];
    _nameLabel.text = @"名字";
    _nameLabel.backgroundColor = [UIColor clearColor];
    _nameLabel.font = [UIFont boldSystemFontOfSize:18];
    
    [view addSubview:_nameLabel];
    
    //设置评级
    _starView = [[StarView alloc] initWithFrame:CGRectMake(80, 30, 65, 23)];
    [_starView setStar:5];
    [view addSubview:_starView];
    
    
    //描述标签
    _descriptionLabel  = [[UILabel alloc] initWithFrame:CGRectMake(80, 50, 320-120, 21)];
    _descriptionLabel.text = @"描述";
    _descriptionLabel.backgroundColor = [UIColor clearColor];
    _descriptionLabel.font = [UIFont boldSystemFontOfSize:14];
    _descriptionLabel.numberOfLines = 3;
    [view addSubview:_descriptionLabel];
    
    
    return view;
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
