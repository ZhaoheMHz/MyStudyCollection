//
//  GPListCell.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPListCell.h"
#import "GPList.h"

@interface GPListCell()
@property (weak, nonatomic) IBOutlet UILabel *nameTitleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *picOne;
@property (weak, nonatomic) IBOutlet UIImageView *picTwo;
@property (weak, nonatomic) IBOutlet UIImageView *picThree;

@property (weak, nonatomic) IBOutlet UILabel *sourceLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

@implementation GPListCell


+(id)listCellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView];
}

- (void)setNews:(GPNews *)news
{
    _news = news;
    
    GPList * list = (GPList *)news;
    
    //跟新子控件内容
    self.nameTitleLabel.text = list.title;
    self.picOne.image = [UIImage imageNamed:list.pics[0]];
    self.picTwo.image = [UIImage imageNamed:list.pics[1]];
    self.picThree.image = [UIImage imageNamed:list.pics[2]];
    self.sourceLabel.text = list.source;
    self.timeLabel.text = list.time;
    
}

@end
