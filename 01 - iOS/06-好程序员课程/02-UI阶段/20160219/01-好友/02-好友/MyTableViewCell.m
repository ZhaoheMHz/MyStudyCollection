//
//  MyTableViewCell.m
//  02-好友
//
//  Created by 哲 肖 on 16/2/17.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

//把cell的创建过程,封装到cell内部自己来处理
+ (id)myTableViewCellWithTableView:(UITableView *)tableView
{
    //1.从缓存池中找是否有可以重用的cell对象
    //2.如果没有,那么创建一个新的cell对象
    NSString * Identifier = NSStringFromClass([self class]);//@"MyTableViewCell";
    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    if(cell == nil)
    {
        cell = [[self alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
    }
    
    return cell;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])
    {
        
        //在构造方法中创建子控件
        
        UIImageView * icon = [[UIImageView alloc] init];
//        [cell addSubview:icon];
        
        //注意,在给cell添加子控件的时候,都要添加到contentView中去,方便统一管理
        [self.contentView addSubview:icon];

        icon.frame = CGRectMake(0, 40, 70, 70);
//        icon.image = [UIImage imageNamed:@"u=1131637654,361137156&fm=116&gp=0.jpg"];
        self.icon = icon;
        
        UILabel * titleNameLabel = [[UILabel alloc] init];
//        [cell addSubview:titleNameLabel];
        [self.contentView addSubview:titleNameLabel];
        titleNameLabel.frame = CGRectMake(80, 40, 100, 30);
        self.titleNameLabel = titleNameLabel;
        
//        titleNameLabel.text = @"adgcc";//friend.name;
    }
    return self;
}

- (void)setFriend:(GPFriend *)Friend
{
    _Friend = Friend;
    
    //2.更新子控件显示的内容
    self.icon.image = [UIImage imageNamed:Friend.icon];
    self.titleNameLabel.text = Friend.name;
}

//- (void)dealloc
//{
//    NSLog(@"MyTableViewCell 被销毁了 %p",self);
//}

@end
