//
//  TopicViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "TopicViewController.h"

#import "NetInterface.h"


#import "TopicModel.h"

#import "AppModel.h"

#import "TopicCell.h"


#import "DetailViewController.h"

#import "MMProgressHUD.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface TopicViewController ()
{
    //数据源
    NSMutableArray *_dataArray;
    int _currentPage;
    
    //表格视图
    UITableView *_tableView;
    
    //下拉刷新和上拉加载更多
    MJRefreshHeaderView *_header;
    MJRefreshFooterView *_footer;
    
    
}
@end

@implementation TopicViewController

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
    
    
    //初始化数据源
    _dataArray = [[NSMutableArray alloc] init];
    
    
    //显示tableView
    //  后续改进: 设置位置
    CGRect rect = CGRectMake(0, 0, 320, 416);
    _tableView  = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    // 3.3行集成下拉刷新控件
    _header = [MJRefreshHeaderView header];
    _header.scrollView = _tableView;
    _header.delegate = self;
    // 4.3行集成上拉加载更多控件
    _footer = [MJRefreshFooterView footer];
    _footer.scrollView = _tableView;
    _footer.delegate = self;
    
    
    //异步下载数据,异步加载
    _currentPage = 1;
    [self startDownloadData];
    
}

#pragma mark - 数据下载和解析
-(void)startDownloadData
{
    // 显示一个HUB进度表 显示....
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    [MMProgressHUD showWithTitle:nil status:@"正在加载数据"];
    
    //开始下载
    NSString *url = [NSString stringWithFormat:TOPIC_URL,_currentPage];
    //NSLog(@"startDownloadData url = %@",url);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //转化为字符串显示
        //NSString *string = [[NSString alloc] initWithData:request.downloadData encoding:NSUTF8StringEncoding];
        //NSLog(@"string = %@",string);
        
        //转换为数组数据
        NSArray *array = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"array = %@",array);
        
        /*
         "title": "和《星你》一起玩星星游戏",
         "date": "2014-02-26",
         "img": "http://special.candou.com/fc3b85d07e093e01da1fc5354c0fe50a.jpg",
         "desc_img": "http://special.candou.com/bc02eddd7785db5cf48087b8cac06d51.jpg",
         "desc": "小编mm推荐：追韩剧当然不能忘了玩游戏，各色星星都已在此，你准备好了啤酒和炸鸡了么？",
         "applications":
         */
        NSMutableArray *tmpDataArray = [[NSMutableArray alloc] init];
        for (NSDictionary *topicDict in array) {
            TopicModel *topicModel = [[TopicModel alloc] init];
            for (NSString *key in topicDict) {
                [topicModel setValue:topicDict[key] forKey:key];
            }
            
            //获取app列表
            NSArray *applist = topicDict[@"applications"];
            topicModel.applications = [[NSMutableArray alloc] init];
            for (NSDictionary *appDict in applist) {
                AppModel *model = [[AppModel alloc] init];
                for (NSString *key in appDict) {
                    [model setValue:appDict[key] forKey:key];
                }
                [topicModel.applications addObject:model];
                
            }
            
            [tmpDataArray addObject:topicModel];
        }
        
        //如果是需要显示第一页, 则清空以前的数据
        if(_currentPage == 1)
        {
            [_dataArray removeAllObjects];
        }
        [_dataArray addObjectsFromArray:tmpDataArray];
        
        
        
        //刷新显示tableView
        [_tableView reloadData];
        
        
        //停止刷新控件
        [_header endRefreshing];
        [_footer endRefreshing];
        
        
        [MMProgressHUD dismissWithSuccess:@"成功下载了"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}



#pragma mark - 数据表格中显示

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    TopicCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[TopicCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    TopicModel *topicModel = [_dataArray objectAtIndex:indexPath.row];

    cell.titleLabel.text = topicModel.title;
    [cell.imgView setImageWithURL:[NSURL URLWithString:topicModel.img]];
    
    [cell.imgDescView setImageWithURL:[NSURL URLWithString:topicModel.desc_img]];
    cell.descLabel.text = topicModel.desc;
    
    
    //为TopicCell中的4个AppShowView设置值
    for (int i=0; i<cell.appShowViewArray.count; i++) {
        AppShowView *showView = cell.appShowViewArray[i];
        AppModel *appModel = topicModel.applications[i];
        
        showView.titleLabel.text = appModel.name;
        [showView.iconImageView setImageWithURL:[NSURL URLWithString:appModel.iconUrl]];
        showView.commentLabel.text = [NSString stringWithFormat:@"%@",appModel.downloads];
        showView.downLabel.text = [NSString stringWithFormat:@"%@",appModel.downloads];
        
        //为这个应用添加点击手势
        showView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(appShowViewClick:)];
        
        //ARC下需要这样写
        showView.tag = (int)CFBridgingRetain(appModel);
        
        [showView addGestureRecognizer:tap];
        
    }
    
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 308.0;
}

-(void)appShowViewClick:(UITapGestureRecognizer *)tap
{
    
    //AppModel *model = (AppModel *)tap.view.tag;
     
    AppModel *model = (AppModel *)CFBridgingRelease((void *)tap.view.tag);
    
    DetailViewController *dvc = [[DetailViewController alloc] init];
    dvc.model = model;
    [self.navigationController pushViewController:dvc animated:YES];
    
    
}

#pragma mark - MJRefresh

//刷新
- (void)refreshViewBeginRefreshing:(MJRefreshBaseView *)refreshView
{
    //如果是下拉刷新
    if(refreshView == _header)
    {

        //NSLog(@"refreshView == _header");
        _currentPage = 1;
        [self startDownloadData];
        
    }
    else
    {
        _currentPage++;
        [self startDownloadData];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}

@end
