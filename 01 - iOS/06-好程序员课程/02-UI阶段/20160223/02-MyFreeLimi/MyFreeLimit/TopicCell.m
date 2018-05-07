//
//  TopicCell.m
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "TopicCell.h"

@implementation TopicCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    //cell大小 310X308
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 308)];
    bg.image = [UIImage imageNamed:@"topic_Cell_Bg.png"];
    [self addSubview:bg];
    
    
    
    //_titleLabel;
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 320, 30)];
    _titleLabel.font = [UIFont boldSystemFontOfSize:18];
    [self addSubview:_titleLabel];
   
    
    
    //_imgView;
    _imgView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 50, 122, 186)];
    [self addSubview:_imgView];
   
    
    //右边显示4个应用 appShowViewArray
    self.appShowViewArray = [[NSMutableArray alloc] init];
    double w=160;
    double h=50;
    double x=140;
    double y;
    for (int i=0; i<4; i++) {
        y = 50 + i*h;
        AppShowView *showView = [[AppShowView alloc] initWithFrame:CGRectMake(x, y, w, h)];
        [self addSubview:showView];
        [_appShowViewArray addObject:showView];
    }
    
    
    
    //_imgDescView;
    _imgDescView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 260, 40, 40)];
    [self addSubview:_imgDescView];
    
    
    //_descLabel;
    _descLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 260, 240, 40)];
    _descLabel.numberOfLines = 3;
    _descLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:_descLabel];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
