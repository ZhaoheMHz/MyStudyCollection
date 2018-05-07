//
//  GPSubjectCell.h
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPSubject.h"

//如果外面有需要直接访问该属性,那么就在.h文件中声明
//如果不希望外面能够随便修改该属性的内容,那么就在.m文件中声明

@interface GPSubjectCell : UITableViewCell

@property (nonatomic, strong)GPSubject * subject;

@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (weak, nonatomic) IBOutlet UILabel *cardNumberLabel;

@property (weak, nonatomic) IBOutlet UILabel *nodeLabel;


+(id)subjectCellWithTableView:(UITableView *)tableView;

@end
