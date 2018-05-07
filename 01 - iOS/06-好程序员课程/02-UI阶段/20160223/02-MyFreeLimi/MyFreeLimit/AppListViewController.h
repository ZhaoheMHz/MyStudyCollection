//
//  AppListViewController.h
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "RootViewController.h"

#import "MJRefresh.h"

#import "CategoryViewController.h"

@interface AppListViewController : RootViewController <UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate,MJRefreshBaseViewDelegate>
{
    NSMutableArray *_dataArray;
    UITableView *_tableView;
    NSUInteger _currentPage;
    BOOL _isShowHUD;
}

@property (nonatomic, copy) NSString *urlstring;
@property (nonatomic, copy) NSString *categoryId;
@end
