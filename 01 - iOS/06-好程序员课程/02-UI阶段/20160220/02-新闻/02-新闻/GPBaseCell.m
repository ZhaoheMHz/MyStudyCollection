//
//  GPBaseCell.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPBaseCell.h"

@implementation GPBaseCell


+(id)cellWithTableView:(UITableView *)tableView
{
    NSString * className = NSStringFromClass([self class]);
    
    UINib * nib = [UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:className];
    
    return [tableView dequeueReusableCellWithIdentifier:className];
}


@end
