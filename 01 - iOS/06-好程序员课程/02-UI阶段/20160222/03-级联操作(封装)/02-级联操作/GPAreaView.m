//
//  GPAreaView.m
//  02-级联操作
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPAreaView.h"

@interface GPAreaView()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic, weak)UITableView * areaTabelView;

@end

@implementation GPAreaView

+(id)areaViewWithFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        UITableView * areaTabelView = [[UITableView alloc] init];
        [self addSubview:areaTabelView];
        areaTabelView.dataSource = self;
        areaTabelView.delegate = self;
        areaTabelView.frame = self.bounds;
        self.areaTabelView = areaTabelView;
    }
    return self;
}

- (void)setAreaArray:(NSArray *)areaArray
{
    _areaArray = areaArray;
    
    [self.areaTabelView reloadData];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
 
    return self.areaArray.count;

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
 
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = self.areaArray[indexPath.row];
    return cell;

}//end method




@end
