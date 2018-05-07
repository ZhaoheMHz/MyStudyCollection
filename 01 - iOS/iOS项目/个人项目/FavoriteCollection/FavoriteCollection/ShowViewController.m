//
//  ShowViewController.m
//  FavoriteCollection
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ShowViewController.h"
#import "AddItemController.h"
#import "DatabaseManager.h"
#import "ModelCell.h"
#import "Model.h"
#import "RootTabBarController.h"
#import "SearchResultController.h"

@interface ShowViewController ()<UITableViewDataSource, UITableViewDelegate, AddItemDelegate, UIAlertViewDelegate, UISearchBarDelegate>
{
    UITableView *_tableView;
    NSMutableArray *_dataArray;
    UISearchController *_searchVC;
    SearchResultController *_resultVC;
    
    // 设置搜索类型,默认为1(name),2(info)
    NSInteger _searchType;
    BOOL _isRefresh;
}
@end

@implementation ShowViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:YES];
    
    _searchType = 1;
    
    // 加载页面的时候,就加载数据库中的数据
    if (_isRefresh) {
        _dataArray.array = [[DatabaseManager defaultManager] selectSetionWith:[self getCategory:self.navigationController.tabBarItem.title] andSort:@"commitdate desc"];
    }
    
    _isRefresh = NO;
    
    _searchVC.searchBar.placeholder = [NSString stringWithFormat:@"总计%zd条", _dataArray.count];
    
    [_tableView reloadData];
}

- (void)setIsRefresh:(BOOL)isRefresh {
    _isRefresh = isRefresh;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc] init];
    
    _dataArray.array = [[DatabaseManager defaultManager] selectSetionWith:[self getCategory:self.navigationController.tabBarItem.title] andSort:@"commitdate desc"];
    
    
    // 一些小设置
    UIColor *barTintColor = [UIColor colorWithRed:254/255.0 green:195/255.0 blue:8/255.0 alpha:1];
    
    self.navigationController.navigationBar.barTintColor = barTintColor;
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.tabBarController.tabBar.barTintColor = barTintColor;
    self.tabBarController.tabBar.tintColor = [UIColor blackColor];
    
    [self createUI];
}

//获取当前viewController的所属分类
- (NSString *)getCategory:(NSString *)str {
    if ([str isEqualToString:K_TITLE_1]) {
        return @"1";
    } else if ([str isEqualToString:K_TITLE_2]) {
        return @"2";
    } else if ([str isEqualToString:K_TITLE_3]) {
        return @"3";
    } else if ([str isEqualToString:K_TITLE_4]) {
        return @"4";
    } else {
        return @"0";
    }
}

#pragma mark - 创建UI
- (void)createUI
{
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGRect frame = self.view.frame;
    frame.origin.y = 64;
    frame.size.height -= 64+49;
    _tableView = [[UITableView alloc] initWithFrame:frame];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [[UIView alloc] init];
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"ModelCell" bundle:nil] forCellReuseIdentifier:@"cellID"];
    
    // 创建navItem,添加项目
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addItem)];
    
    // 创建navItem,选择排序
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"排序" style:UIBarButtonItemStylePlain target:self action:@selector(sortItem)];
    
    // 创建navItem,批量删除
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
    [button setTitle:@"批量删除" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:1] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2] forState:UIControlStateHighlighted];
    
    [button addTarget:self action:@selector(mutilDelete:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = button;
    
    _tableView.allowsMultipleSelectionDuringEditing = YES;
    
    // 设置搜索栏
    [self settingSearchBar];
}

- (void)settingSearchBar {
    // 创建搜索拦
    _resultVC = [[SearchResultController alloc] init];
    
    _searchVC = [[UISearchController alloc] initWithSearchResultsController:_resultVC];
    [_searchVC.searchBar setTintColor:[UIColor blackColor]];
    _searchVC.searchBar.placeholder = @"搜索";
    
    CGRect searchFrame = _searchVC.searchBar.frame;
    searchFrame.size.height = 40;
    _searchVC.searchBar.frame = searchFrame;

    _tableView.tableHeaderView = _searchVC.searchBar;
    _searchVC.searchBar.delegate = self;
}

#pragma mark - 搜索栏的代理方法
// searchBar的输入文字发生改变时调用
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    NSMutableArray *resultArr = [[NSMutableArray alloc] init];
    
    switch (_searchType) {
        case 1:
        {
            for (Model *model in _dataArray) {
                if ([model.name containsString:searchText]) {
                    [resultArr addObject:model];
                }
            }
        }
            break;
        case 2:
        {
            for (Model *model in _dataArray) {
                if ([model.info containsString:searchText]) {
                    [resultArr addObject:model];
                }
            }
        }
            break;
        default:
            break;
    }
    
    NSArray *arr = [resultArr sortedArrayUsingComparator:^(Model * m1,Model *m2) {
        
        if ([m1.name localizedCaseInsensitiveCompare:m2.name] == 1) {
            return NSOrderedDescending;
        } else {
            return NSOrderedAscending;
        }
    }];
    
    _resultVC.resultArr = arr;
    [_resultVC.tableView reloadData];
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    switch (_searchType) {
        case 1:
        {
            searchBar.placeholder = @"按名称搜索";
        }
            break;
        case 2:
        {
            searchBar.placeholder = @"按信息搜索";
        }
            break;
        default:
            break;
    }
    
    searchBar.showsCancelButton = YES;
    searchBar.showsSearchResultsButton = YES;
    for (id cc in [searchBar.subviews[0] subviews]) {
        if ([cc isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)cc;
            [btn setTitle:@"取消" forState:UIControlStateNormal];
        }
    }
}

- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar {
    
    if (_searchType == 1) {
        _searchType = 2;
        searchBar.placeholder = @"按信息查找";
    } else {
        _searchType = 1;
        searchBar.placeholder = @"按名称查找";
    }
}

#pragma mark - 批量删除
- (void)mutilDelete:(UIButton *)button {
    if (_tableView.editing == NO) {
        _tableView.editing = YES;
        [button setTitle:@"确定删除" forState:UIControlStateNormal];
    } else {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"确定删除吗" message:@"删除的数据,无法回滚,请三思" delegate:self cancelButtonTitle:@"再想想" otherButtonTitles:@"心意已决", nil];
        
        NSArray *selectCellArr = [_tableView indexPathsForSelectedRows];
        if (selectCellArr.count == 0) {
            [button setTitle:@"批量删除" forState:UIControlStateNormal];
            _tableView.editing = NO;
        } else {
            [av show];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 1) {
        NSArray *selectCellArr = [_tableView indexPathsForSelectedRows];
        for (NSIndexPath *indexPath in selectCellArr) {
            [[DatabaseManager defaultManager] deleteWithModel:_dataArray[indexPath.row]];
        }
        
        NSInteger haveDeletedData = 0;
        for (NSIndexPath *indexPath in selectCellArr) {
            NSInteger row = indexPath.row - haveDeletedData;
            [_dataArray removeObjectAtIndex:row];
            
            haveDeletedData ++;
        }
        
        [_tableView deleteRowsAtIndexPaths:selectCellArr withRowAnimation:UITableViewRowAnimationLeft];
        
        UIButton *button = (id)self.navigationItem.titleView;
        [button setTitle:@"批量删除" forState:UIControlStateNormal];
        
        _tableView.editing = NO;
    }
}

// 添加项目
- (void)addItem
{
    _tableView.editing = NO;
    
    AddItemController *addController = [[AddItemController alloc] init];
    addController.delegate = self;
    
    // 为详细信息信息界面添加分类信息
    addController.category = [self getCategory:self.navigationController.tabBarItem.title];
    addController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:addController animated:YES];
}

// 选择排序方式
- (void)sortItem {
    _tableView.editing = NO;
    
    /**
     使用UIAlertController代替UIActionSheet
     */
    
    // 创建AlertController,并指定样式为ActionSheet
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"请选择排序方式" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    
    // 创建action,并添加到Controller中
    UIAlertAction *defaultSort = [UIAlertAction actionWithTitle:@"默认排序(提交时间)" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _dataArray.array = [[DatabaseManager defaultManager] selectSetionWith:[self getCategory:self.navigationController.tabBarItem.title] andSort:@"commitdate desc"];
        [_tableView reloadData];
    }];
    UIAlertAction *starSort = [UIAlertAction actionWithTitle:@"按星级排序" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _dataArray.array = [[DatabaseManager defaultManager] selectSetionWith:[self getCategory:self.navigationController.tabBarItem.title] andSort:@"star desc"];
        [_tableView reloadData];
    }];
    UIAlertAction *nameSort = [UIAlertAction actionWithTitle:@"按名称排序" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        _dataArray.array = [[DatabaseManager defaultManager] selectSetionWith:[self getCategory:self.navigationController.tabBarItem.title] andSort:@"name"];
        [_tableView reloadData];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [ac dismissViewControllerAnimated:YES completion:nil];
    }];
    [ac addAction:defaultSort];
    [ac addAction:starSort];
    [ac addAction:nameSort];
    [ac addAction:cancelAction];
    
    [self presentViewController:ac animated:YES completion:nil];
}

#pragma mark - tableView相关
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ModelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellID" forIndexPath:indexPath];
    
    Model *model = _dataArray[indexPath.row];
    
    [cell loadModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_tableView.editing == YES) {
        return;
    }
    
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AddItemController *addController = [[AddItemController alloc] init];
    addController.model = _dataArray[indexPath.row];
    
    [self.navigationController pushViewController:addController animated:YES];
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}

// 删除数据
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    // 从数据库和数据源删除数据
    if ([[DatabaseManager defaultManager] deleteWithModel:_dataArray[indexPath.row]]) {
        NSLog(@"delete成功");
        [_dataArray removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    } else {
        NSLog(@"delete失败");
    }
}

#pragma mark - addController的代理方法
- (void)addItemWithModel:(Model *)model
{
    [_dataArray addObject:model];
}

@end
