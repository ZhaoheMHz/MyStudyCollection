//
//  GPHeaderView.m
//  03-qq分组列表
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "GPHeaderView.h"

@interface GPHeaderView()

@property(nonatomic,weak)UIButton * titleButton;

@property(nonatomic,assign)BOOL flag;

@end

@implementation GPHeaderView

+(id)headerViewWithTableView:(UITableView *)tableView
{
    static NSString * ident = @"header";
    // UITableViewHeaderFooterView 头部,与尾部标题,可重用的视图对象
    GPHeaderView * headerView =  [tableView dequeueReusableHeaderFooterViewWithIdentifier:ident];
    
    if(headerView == nil)
    {
        headerView = [[self alloc] initWithReuseIdentifier:ident];
    }
    
    return headerView;
}

- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if(self = [super initWithReuseIdentifier:reuseIdentifier])
    {
        UIButton * titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        titleButton.frame = CGRectMake(0, 0, 375, 60);
//        [titleButton setTitle:@"好友" forState:UIControlStateNormal];
        [titleButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self.contentView addSubview:titleButton];
        self.titleButton = titleButton;
        
        [titleButton setImage:[UIImage imageNamed:@"buddy_header_arrow"] forState:UIControlStateNormal];
        
        titleButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        titleButton.contentEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        titleButton.titleEdgeInsets = UIEdgeInsetsMake(0, 20, 0, 0);
        titleButton.imageView.contentMode = UIViewContentModeCenter;
        titleButton.imageView.clipsToBounds = NO;
    
        [titleButton addTarget:self action:@selector(btnTouch:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return self;
}

- (void)setGroup:(GPGroup *)group
{
    _group = group;
    
    [self.titleButton setTitle:group.title forState:UIControlStateNormal];
    
    [self imageAnimation:group.expand];//yes
}


- (void)btnTouch:(UIButton *)btn
{
    /*
    if((_flag = !_flag))
    {
        self.titleButton.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        
    }
    else
    {
        self.titleButton.imageView.transform = CGAffineTransformIdentity;
    }
    */

    
    //把当前是展开,还是合并状态直接同步到Group模型中去
    self.group.expand = !self.group.expand;
    
    [self imageAnimation:self.group.expand];
    
    [self.delegate headerView:self Status:self.group.expand];
    
}

- (void)imageAnimation:(BOOL)expand
{
    if(expand)
    {
        self.titleButton.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
        
    }
    else
    {
        self.titleButton.imageView.transform = CGAffineTransformIdentity;
    }

}


@end
