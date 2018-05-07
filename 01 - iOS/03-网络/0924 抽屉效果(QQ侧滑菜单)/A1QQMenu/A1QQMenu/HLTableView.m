//
//  HLTableView.m
//  A1QQMenu
//
//  Created by 赵赤赤 on 15/9/24.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "HLTableView.h"

@implementation HLTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        self.backgroundColor = [UIColor clearColor];
        self.separatorColor = [UIColor clearColor];
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (void)configWithArray:(NSArray *)dataArr target:(id)target selctor:(SEL)selector {
    self.dataArr = dataArr;
    self.target = target;
    self.selector = selector;
    [self reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_dataArr count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"qqq"];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = _dataArr[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // 判断某个对象是否可以响应某个方法
    if (self.target && [self.target respondsToSelector:self.selector]) {
        [self.target performSelector:self.selector withObject:indexPath afterDelay:0];
    }
}

@end
