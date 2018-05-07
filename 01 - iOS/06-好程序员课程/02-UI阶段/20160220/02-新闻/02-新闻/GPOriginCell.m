//
//  GPOriginCell.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPOriginCell.h"
#import "GPOrigin.h"

@interface GPOriginCell()

@property (weak, nonatomic) IBOutlet UILabel *nameTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;

@end

@implementation GPOriginCell

+(id)originCellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView];
}

- (void)setNews:(GPNews *)news
{
    _news = news;
    
    GPOrigin * origin = (GPOrigin *)news;
    
    self.nameTitleLabel.text = origin.title;
    self.sourceLabel.text = origin.source;
    self.pictureImageView.image = [UIImage imageNamed:origin.picture];
}

@end
