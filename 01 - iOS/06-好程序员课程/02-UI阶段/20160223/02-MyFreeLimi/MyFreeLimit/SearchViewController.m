//
//  SearchViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-1-4.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "SearchViewController.h"

#import "AppCell.h"
#import "AppModel.h"

#import "MMProgressHUD.h"

#import "DetailViewController.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface SearchViewController ()
{

}
@end

@implementation SearchViewController

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
    
    
    //设置数据源
    _dataArray = [[NSMutableArray alloc] init];
    
    //设置tableView
    //  后续改进: 设置位置
    CGRect rect = CGRectMake(0, 0, 320, 416);
    _tableView  = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    [self startDownloadData];
}

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
    cell.nameLabel.text = model.name;
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    cell.priceLabel.text = [NSString stringWithFormat:@"%@", model.lastPrice];
    //NSLog(@"lp = %f",model.lastPrice);
    
    cell.sharesLabel.text = [NSString stringWithFormat:@"分享: %@",model.shares];
    cell.favoritesLabel.text = [NSString stringWithFormat:@"收藏: %@",model.favorites];
    cell.downloadsLabel.text = [NSString stringWithFormat:@"下载: %@",model.downloads];
    cell.categoryLabel.text = model.categoryName;
    [cell.starView setStar:model.starCurrent.doubleValue];
    
    
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


#pragma mark - 数据下载和解析

-(void)startDownloadData
{
    // 显示一个HUB进度表 显示....
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    [MMProgressHUD showWithTitle:nil status:@"正在加载数据"];
    
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:self.urlstring parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"dict = %@",dict);
        
        NSMutableArray *tmpDataArray = [[NSMutableArray alloc] init];
        
        NSArray *arr = [dict objectForKey:@"data"];
        for (NSDictionary *app in arr) {
            
            
            //创建数据模型对象,加入数据数组
            
            //注意: 此处由于属性名和下载数据的key值不匹配, 不要要kvc
            
            AppModel *model = [[AppModel alloc] init];
            [model setValuesForKeysWithDictionary:app];
            /*
            model.applicationId = [app objectForKey:@"appid"];
            model.name = [app objectForKey:@"name"];
            model.currentPrice = [app objectForKey:@"price"];
            model.lastPrice = [app objectForKey:@"old_price"];
            model.iconUrl = [app objectForKey:@"icon"];
            model.description = [app objectForKey:@"description"];
            model.itunesUrl = [app objectForKey:@"itunesUrl"];
            model.shares = [app objectForKey:@"shares"];
            model.favorites = [app objectForKey:@"favorites"];
            model.downloads = [app objectForKey:@"downloads"];
            model.starCurrent = [app objectForKey:@"starCurrent"];
            model.starOverall = [app objectForKey:@"starOverall"];
            model.categoryName = [app objectForKey:@"category"];
            model.fileSize = [app objectForKey:@"fileSize"];
            */
            ;
            [tmpDataArray addObject:model];
        }
        
        
        //如果是需要显示第一页, 则清空以前的数据
        
        
        [_dataArray addObjectsFromArray:tmpDataArray];
        
        
        //刷新列表
        [_tableView reloadData];
        
        
        [MMProgressHUD dismissWithSuccess:@"成功下载了"];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
  

}



-(void)showLeftButtonWithTitle:(NSString *)string
                        target:(id)target
                        action:(SEL)action
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:string style:UIBarButtonItemStylePlain target:target action:action];
    self.navigationItem.leftBarButtonItem = item;
    
}
-(void)showRightButtonWithTitle:(NSString *)string
                         target:(id)target
                         action:(SEL)action
{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:string style:UIBarButtonItemStylePlain target:target action:action];
    self.navigationItem.rightBarButtonItem = item;
    
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
