//
//  CommonViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "AppListViewController.h"


#import "AppModel.h"
#import "AppCell.h"


#import "MMProgressHUD.h"

#import "MJRefresh.h"

#import "NetInterface.h"

#import "SearchViewController.h"

#import "DetailViewController.h"

#import "SettingViewController.h"

#import "QFDevice.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"


typedef
enum NavLocation{NAV_LEFT,NAV_RIGHT}
NavLocation;


@interface AppListViewController ()
{
    MJRefreshHeaderView *_header;
    MJRefreshFooterView *_footer;

}
@end

@implementation AppListViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //设置导航条背景图
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbar.png"] forBarMetrics:UIBarMetricsDefault];
    
    //导航条添加左边按钮
    [self addNavgationButton:@"分类" tartget:self action:@selector(leftNavBtnClick:) type:NAV_LEFT];
    //添加右边按钮
    [self addNavgationButton:@"配置" tartget:self action:@selector(rightNavBtnClick:) type:NAV_RIGHT];
    
    //设置数据源
    _dataArray = [[NSMutableArray alloc] init];
    
    //设置tableView
    //  后续改进: 设置位置
    //版本适配: 高度= 屏幕高度- 状态20 - 导航44-标签49
    double h = kScreenHeight - 20-44;
    CGRect rect = CGRectMake(0, 0, 320, h);
    _tableView  = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    NSLog(@"->%f %f",
          self.tabBarController.tabBar.frame.size.width,
          self.tabBarController.tabBar.frame.size.height);
    
    
    //添加搜索栏
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame= CGRectMake(0, 0, 320, 40);
    searchBar.delegate = self;
    searchBar.placeholder = @"60万款应用搜搜看";
    _tableView.tableHeaderView = searchBar;
    
    
    //初始化分类id, 空表示全部
    _categoryId = @"";
    _currentPage = 1;
    [self startDownloadData];
    

    // 3.3行集成下拉刷新控件
    _header = [MJRefreshHeaderView header];
    _header.scrollView = _tableView;
    _header.delegate = self;
    
    // 4.3行集成上拉加载更多控件
    _footer = [MJRefreshFooterView footer];
    _footer.scrollView = _tableView;
    _footer.delegate = self;
    
    
    
}




#pragma mark - 导航栏

//导航条上添加按钮
//  添加一个标题为title的按钮,点击之后执行target和action指定的方法
// type=LEFT添加到导航栏的左边, RIGHT添加到右边
-(void)addNavgationButton:(NSString *)title
                  tartget:(id)target
                   action:(SEL)action
                     type:(NavLocation)type
{
    //创建按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, 44, 30);
    [button setBackgroundImage:[UIImage imageNamed:@"buttonbar_action.png"] forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    //创建Item
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    if(type == NAV_LEFT)
    {
        self.navigationItem.leftBarButtonItem = item;
    }
    else if(type == NAV_RIGHT)
    {
        self.navigationItem.rightBarButtonItem = item;
    }
}

-(void)leftNavBtnClick:(UIBarButtonItem *)item
{
    //NSLog(@"categoryClick");
    
    CategoryViewController *cvc = [[CategoryViewController alloc] init];
    
    cvc.changeCategory = ^(NSString *categoryId)
    {
        NSLog(@"changeCategory");
    
        
        if(categoryId == nil)
        {
            categoryId = @"";
        }
        //NSLog(@"idString = %@",idString);
        
        //初始化分类id, 空表示全部
        _categoryId = categoryId;
        //分类改变了, 设置为1之后, 会重新清空数据源, 重新下载
        _currentPage = 1;
        [self startDownloadData];
    };
    
    
    [self.navigationController pushViewController:cvc animated:YES];
    
}
-(void)rightNavBtnClick:(UIBarButtonItem *)item
{
    SettingViewController *svc = [[SettingViewController alloc] init];
    
    [self.navigationController pushViewController:svc animated:YES];
}

#pragma mark - 数据下载和解析

-(void)startDownloadData
{
    
    

    //注意: 程序刚开始的时候不需要显示, 显示则显示位置有问题
    if(_isShowHUD == NO)
    {
        _isShowHUD = YES;
    }
    else
    {
        // 显示一个HUB进度表 显示....
        [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
        [MMProgressHUD showWithTitle:nil status:@"正在加载数据"];
    }
    
    
    NSString *urlString = [NSString stringWithFormat:self.urlstring,_currentPage,self.categoryId];
    
    NSLog(@"urlString = %@",urlString);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"dict = %@",dict);
        
        NSMutableArray *tmpDataArray = [[NSMutableArray alloc] init];
        
        NSArray *arr = [dict objectForKey:@"applications"];
        for (NSDictionary *appDict in arr) {
            
            //创建数据模型对象,加入数据数组
            AppModel *model = [[AppModel alloc] init];
            
            for (NSString *key in appDict) {
                [model setValue:appDict[key] forKey:key];
            }
            
            [tmpDataArray addObject:model];
        }
        
        
        //如果是需要显示第一页, 则清空以前的数据
        //注意: 清空数据之后需要立即刷新tableView
        if(_currentPage == 1)
        {
            [_dataArray removeAllObjects];
        }
        [_dataArray addObjectsFromArray:tmpDataArray];
        
        //刷新列表
        [_tableView reloadData];
        
        [_header endRefreshing];
        [_footer endRefreshing];
        
        [MMProgressHUD dismissWithSuccess:@"成功下载了"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}

#pragma mark - 数据的显示
//两个方法

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //此处显示应用信息
    static NSString *cellID = @"app cell";
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[AppCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //cell.iconImage =
    AppModel *model = [_dataArray objectAtIndex:indexPath.row];
    cell.nameLabel.text = [NSString stringWithFormat:@"%d.%@",indexPath.row+1,model.name];
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@", model.lastPrice];
    //NSLog(@"lp = %f",model.lastPrice);
    
    cell.sharesLabel.text = [NSString stringWithFormat:@"分享: %@",model.shares];
    cell.favoritesLabel.text = [NSString stringWithFormat:@"收藏: %@",model.favorites];
    cell.downloadsLabel.text = [NSString stringWithFormat:@"下载: %@",model.downloads];
    cell.categoryLabel.text = model.categoryName;
    
    [cell.starView setStar:model.starCurrent.intValue];
    
    
    //设置背景图片
    if (indexPath.row%2 == 0) {
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cate_list_bg1.png"]];
    } else {
        cell.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"cate_list_bg2.png"]];
    }
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([_dataArray count] == 0) {
        return 44.0f;
    } else if ([_dataArray count] == indexPath.row) {
        return 44.0f;
    } else {
        return 100.0f;
    }
}


#pragma mark - 数据下拉刷新和上拉加载更多


//刷新
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    //如果是下拉刷新
    if(refreshView == _header)
    {
        NSLog(@"refreshView == _header");
        _currentPage = 1;
        [self startDownloadData];
        
    }
    else
    {
        _currentPage++;
        [self startDownloadData];
    }
    
}
- (void)refreshView:(MJRefreshBaseView *)refreshView stateChange:(MJRefreshState)state
{
    NSLog(@"refreshViewstateChange");
}
#pragma mark - 搜索处理

//以下两个方法完成后即能达到点击出现cancle, 点击canle恢复的效果

// searchbar刚刚开始处于编辑状态
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    [searchBar setShowsCancelButton:YES animated:YES];
}
// 点击了cancel按钮
- (void) searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
}

// 点击了Search
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    //回收
    [searchBar resignFirstResponder];
    [searchBar setShowsCancelButton:NO animated:YES];
    
    //获取URL
    // 把汉字转化成url encoded可以在网上传输的...
    NSString *str = [searchBar.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"str is %@", str);
    // %E7%90%86%E8%B4%A2 utf8 一个汉字3字节
    NSString *url = [NSString stringWithFormat:SEARCH_URL, str];
    
    
    
    
    //打开页面显示搜索结果
    /*
    //CommonViewController *cvc = [[CommonViewController alloc] init];
    //cvc.urlstring = url;
    //[self.navigationController pushViewController:cvc animated:YES];
    //[cvc release];
     */
    
    SearchViewController *svc = [[SearchViewController alloc] init];
    
    svc.urlstring = url;
    [self.navigationController pushViewController:svc animated:YES];

    
}


#pragma mark - 界面事件处理

//发生的问题1: 误写为didDeselect

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"row = %d,count=%d",indexPath.row,_dataArray.count);
    if(indexPath.row < _dataArray.count)
    {
        AppModel *model = [_dataArray objectAtIndex:indexPath.row];
        
        //创建细节界面
        DetailViewController *dvc = [[DetailViewController alloc] init];
        dvc.model = model;
        [self.navigationController pushViewController:dvc animated:YES];

    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
