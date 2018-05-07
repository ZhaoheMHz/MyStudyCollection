//
//  ViewController.m
//  A1fmdb
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "DetailViewController.h"
#import "DatabaseManager.h"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate, DetailViewControllerDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArr;
}

@end

@implementation ViewController

// 即将出现的时候刷新tableView,实现修改数据的效果
- (void)viewWillAppear:(BOOL)animated
{
    [_tableView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 如果一个页面在导航里,并且这个页面的第一个子试图是ScrollView(包括子类),那么这个页面的第一个子试图会有个自动调整边缘的效果
    // 关掉这个效果
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _dataArr = [[NSMutableArray alloc] init];
    
    // 从数据库中查询出数据,填满
    _dataArr.array = [[DatabaseManager defaultManager] selectAllModel];
    
    [self createUI];
    
    // 设置当前页展示的导航条右侧的专用按钮
    self.navigationItem.title = @"列表";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addClick)];
}

- (void)addClick
{
    DetailViewController *dvc = [[DetailViewController alloc] init];
    dvc.delegate = self;
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)detailInserWithModel:(Person *)ps
{
    [_dataArr addObject:ps];
    [_tableView reloadData];
}

#pragma mark - tableView相关
- (void)createUI
{
    CGRect frame = self.view.frame;
    frame.origin.y = 64;
    frame.size.height -= 64;
    _tableView = [[UITableView alloc] initWithFrame:frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"qqq"];
    }
    
    Person *ps = _dataArr[indexPath.row];
    cell.imageView.image = [UIImage imageWithData:ps.iconData];
    cell.textLabel.text = ps.nameStr;
    cell.detailTextLabel.text = ps.ageStr;
    
    return cell;
}

// 点击条目进详情页
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewController *dvc = [[DetailViewController alloc] init];
    
    dvc.row = (int)indexPath.row;
    dvc.ps = [_dataArr objectAtIndex:indexPath.row];
    
    [self.navigationController pushViewController:dvc animated:YES];
}

@end