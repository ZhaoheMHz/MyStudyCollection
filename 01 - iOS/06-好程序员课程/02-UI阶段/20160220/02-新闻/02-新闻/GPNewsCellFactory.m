//
//  GPNewsCellFactory.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPNewsCellFactory.h"

#import "GPLargeCell.h"
#import "GPListCell.h"
#import "GPOriginCell.h"
#import "GPAppCell.h"

@implementation GPNewsCellFactory

+(GPBaseCell *)cellWithTableView:(UITableView *)tableView news:(GPNews *)news
{
    /*
     
     简单工厂:把一系列对象的创建过程隐藏起来,外界只需要提供必要的条件(参数)
     然后工厂方法中,决定定如何创建对象,以及创建那类对象
     
     */
    GPBaseCell * cell = nil;
    
    if([news.category isEqualToString:@"large"])
    {
        cell = [GPLargeCell largeCellWithTableView:tableView];  

    }
    else if ([news.category isEqualToString:@"list"])
    {
        cell = [GPListCell listCellWithTableView:tableView];

    }
    else if ([news.category isEqualToString:@"origin"])
    {
        cell = [GPOriginCell originCellWithTableView:tableView];

    }
    else if ([news.category isEqualToString:@"app"])
    {
       cell = [GPAppCell appCellWithTableView:tableView];

    }
    
    cell.news = news;
    
    return cell;
}

@end
