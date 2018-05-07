//
//  GPFooterView.m
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPFooterView.h"

@implementation GPFooterView

+(id)footerView
{
    return [[self alloc] init];
}

- (void)setStatus:(GPFooterViewStatus)status
{
    _status = status;
    
    switch (status) {
        case GPFooterViewStatusDragging:
            NSLog(@"拖拽读取更多");
            break;
        case GPFooterViewStatusEndDragging:
            NSLog(@"松开读取更多");
            break;
        case GPFooterViewStatusLoading:
            NSLog(@"加载中");
            break;
        default:
            break;
    }
    
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    //self 是要被TableView addSubView的所以这个方法传递进来的newSuperview对象就一定是一个UITableView对象
    UITableView * tableView = newSuperview;
    
    CGFloat selfX = 0;
    CGFloat selfY = tableView.contentSize.height;
    CGFloat selfW = tableView.frame.size.width;
    CGFloat selfH = 60;
    
    self.frame = CGRectMake(selfX, selfY, selfW, selfH);
    self.backgroundColor = [UIColor grayColor];
}

@end
