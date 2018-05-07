//
//  GPLargeCell.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPLargeCell.h"
#import "GPLarge.h"

@interface GPLargeCell()

@property (weak, nonatomic) IBOutlet UILabel *nameTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *pictureImageView;
@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation GPLargeCell


+(id)largeCellWithTableView:(UITableView *)tableView
{
    
    return [self cellWithTableView:tableView];
}

- (void)setNews:(GPNews *)news
{
    _news = news;
    
    GPLarge * large = (GPLarge *)news;
    
    //更新子控件的内容
    self.nameTitleLabel.text = large.title;
    self.pictureImageView.image = [UIImage imageNamed:large.picture];
    self.sourceLabel.text = large.source;
    self.timeLabel.text = large.time;
    
    //更新Frame值,禁用cell的autolayout属性,否则不能够动态更新子控件的Frame
    self.nameTitleLabel.numberOfLines = 0;
    self.nameTitleLabel.font = [UIFont systemFontOfSize:15];
    
    
    self.nameTitleLabel.frame = large.titleFrame;
    self.pictureImageView.frame = large.pictureFrame;
    self.sourceLabel.frame = large.sourceFrame;
    self.timeLabel.frame = large.timeFrame;
    
}

@end
