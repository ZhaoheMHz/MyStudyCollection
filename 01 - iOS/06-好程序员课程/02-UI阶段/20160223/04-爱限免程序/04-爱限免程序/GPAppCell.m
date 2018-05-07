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
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:className];
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
