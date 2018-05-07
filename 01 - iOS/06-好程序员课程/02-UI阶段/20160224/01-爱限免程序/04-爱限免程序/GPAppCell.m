//
//  GPAppCell.m
//  04-爱限免程序
//
//  Created by 哲 肖 on 16/2/23.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPAppCell.h"
#import "UIImageView+AFNetworking.h"


@interface GPAppCell()

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleNameLabel;

@end

@implementation GPAppCell

+(id)appCellWithTableView:(UITableView *)tableView
{
    NSString * className = NSStringFromClass([self class]);
    
    //当cell是在故事版的tableVeiw中编辑的时候
    //1.先去缓存池中找,如果没有可重用的cell,那么他会去故事版上找,可重用标示为className的cell,创建一个返回回来
    return [tableView dequeueReusableCellWithIdentifier:className];
}

- (void)setApp:(GPApp *)app
{
    _app = app;
    
    //更新cell子控件内容
    self.titleNameLabel.text = app.name;
//    self.iconImageView.image = [UIImage imageNamed:app.iconUrl];
    
    //    [cell.iconImageView setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    NSURL * url = [NSURL URLWithString:app.iconUrl];
    [self.iconImageView setImageWithURL:url];
}

@end
