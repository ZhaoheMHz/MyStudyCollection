//
//  ViewController.m
//  01-微博图文
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"
#import "GPStatuses.h"
#import "GPStatusesCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy)NSArray * statusesArray;


@end

@implementation ViewController

- (NSArray *)statusesArray
{
    if(_statusesArray == nil)
    {
        NSString * path = [[NSBundle mainBundle]pathForResource:@"statuses.plist" ofType:@""];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * objs = [NSMutableArray array];

        for(NSDictionary * dict in dictArray)
        {
            GPStatuses * statuses = [GPStatuses statusesWithDict:dict];
            [objs addObject:statuses];
        }
        
        _statusesArray = objs;
    }
    return _statusesArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
    
}

#pragma mark UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statusesArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPStatusesCell * cell = [GPStatusesCell statusesCellWithTableView:tableView];
    
    cell.statuses = self.statusesArray[indexPath.row];
    
    NSLog(@"%p",cell);
    
    return cell;
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPStatuses * statuses = self.statusesArray[indexPath.row];
    return statuses.rowHeight;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
