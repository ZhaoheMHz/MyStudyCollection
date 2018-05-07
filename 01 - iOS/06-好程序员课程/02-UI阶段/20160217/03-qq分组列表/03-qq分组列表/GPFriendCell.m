//
//  GPFriendCell.m
//  03-qq分组列表
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "GPFriendCell.h"

@implementation GPFriendCell

+(id)friendCellWithTableView:(UITableView *)tableView
{
    static NSString * identifier = @"friend";
    GPFriendCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(cell == nil)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    return cell;
}

- (void)setMyFriend:(GPFriend *)myFriend
{
    _myFriend = myFriend;
    
    //更新子控件中显示的数据内容
    self.textLabel.text = myFriend.name;
    self.imageView.image = [UIImage imageNamed:myFriend.icon];
    self.detailTextLabel.text = myFriend.message;
}

@end
