//
//  AppShowView.m
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "AppShowView.h"

@implementation AppShowView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self createUI];
    }
    return self;
}

-(void)createUI
{
    //大小: 160X50    共4个,总高度200
    
    
    _iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 44, 44)];
    _iconImageView.backgroundColor = [UIColor redColor];
    [self addSubview:_iconImageView];
    [_iconImageView makeCorner:5];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 200, 20)];
    _titleLabel.text = @"title";
    [self addSubview:_titleLabel];
    
    //13X9
    UIImageView *commentView = [[UIImageView alloc] initWithFrame:CGRectMake(50, 18, 13, 9)];
    commentView.image = [UIImage imageNamed:@"topic_Comment.png"];
    [self addSubview:commentView];
    
    _commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(50+13, 15, 100, 20)];
    _commentLabel.font = [UIFont systemFontOfSize:12];
    _commentLabel.text = @"com";
    [self addSubview:_commentLabel];
    
    //10X11
    UIImageView *downloadView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 18, 10, 11)];
    downloadView.image = [UIImage imageNamed:@"topic_Download.png"];
    [self addSubview:downloadView];
    
    //_downLabel;
    _downLabel = [[UILabel alloc] initWithFrame:CGRectMake(100+13, 15, 100, 20)];
    _downLabel.font = [UIFont systemFontOfSize:12];
    _downLabel.text = @"down";
    [self addSubview:_downLabel];
    
    //_starView;
    _starView = [[StarView alloc] initWithFrame:CGRectMake(50, 30, 80, 10)];
    _starView.star = 5;
    [self addSubview:_starView];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
