//
//  SearchViewController.h
//  MyFreeLimit
//
//  Created by mac on 14-1-4.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RootViewController.h"

@interface SearchViewController : RootViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
}
-(void)showLeftButtonWithTitle:(NSString *)string
                        target:(id)target
                        action:(SEL)action;
-(void)showRightButtonWithTitle:(NSString *)string
                         target:(id)target
                         action:(SEL)action;

@property (nonatomic, copy) NSString *urlstring;
@end
