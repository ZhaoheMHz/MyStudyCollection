//
//  CategoryCell.m
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "CategoryCell.h"

@implementation CategoryCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createUI];
    }
    return self;
}

//创建cell上的视图
-(void)createUI
{
    //高度如果为80
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 80)];
    bg.image = [UIImage imageNamed:@"cate_list_bg.png"];
    [self addSubview:bg];
    
    
    
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 7, 60, 60)];
    [self addSubview:_iconImageView];
    
    //categoryNameLabel;
    
    _categoryNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 10, 100, 30)];
    [self addSubview:_categoryNameLabel];
   
    
    _categoryDetailLabel = [[UILabel alloc] initWithFrame:CGRectMake(80, 40, 300, 30)];
    _categoryDetailLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_categoryDetailLabel];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
