//
//  GPAppCell.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPAppCell.h"
#import "GPApp.h"

@interface GPAppCell()
@property (weak, nonatomic) IBOutlet UILabel *nameTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation GPAppCell

+(id)appCellWithTableView:(UITableView *)tableView
{
    return [self cellWithTableView:tableView];
}

- (void)setNews:(GPNews *)news
{
    _news  = news;
    
    GPApp * app = (GPApp *)news;
    
    self.nameTitleLabel.text = app.title;
    self.appNameLabel.text = app.appname;
    self.iconImageView.image = [UIImage imageNamed:app.icon];
}

@end
