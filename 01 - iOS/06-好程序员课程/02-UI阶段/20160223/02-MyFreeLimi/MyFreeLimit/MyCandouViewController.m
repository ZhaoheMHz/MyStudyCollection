//
//  MyCandouViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-4-12.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "MyCandouViewController.h"

#import "NetInterface.h"

#import "MMProgressHUD.h"
#import "AppModel.h"

#import "CandouAppCell.h"

#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"


@interface MyCandouViewController ()
{
    NSMutableArray *_dataArray;
    
    UITableView *_tableView;
    
}
@end

@implementation MyCandouViewController

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
    
    self.navigationItem.title = @"我的蚕豆应用";
    self.view.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
    
    // CANDOU_URL @"http://open.candou.com/mobile/candou"
    
    
    //初始化数组
    _dataArray  = [[NSMutableArray alloc] init];
    
    //创建tableView
    CGRect rect = CGRectMake(0, 0, 320, 416);
    _tableView  = [[UITableView alloc] initWithFrame:rect style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    //异步下载数据
    [self startDownloadData];
    
}

#pragma mark - 数据下载和解析

-(void)startDownloadData
{
    // 显示一个HUB进度表 显示....
    [MMProgressHUD setPresentationStyle:MMProgressHUDPresentationStyleShrink];
    [MMProgressHUD showWithTitle:nil status:@"正在加载数据"];
    
    
    //开始下载
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:CANDOU_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"dict = %@",dict);

        NSMutableArray *tmpDataArray = [[NSMutableArray alloc] init];
        
        NSArray *arr = [dict objectForKey:@"applications"];
        for (NSDictionary *appDict in arr) {
            
            //获取各个属性
            
            //创建数据模型对象,加入数据数组
            AppModel *model = [[AppModel alloc] init];
            for (NSString *key in appDict) {
                [model setValue:appDict[key] forKey:key];
            }
        
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



#pragma mark - 数据的表格显示

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //此处显示应用信息
    static NSString *cellID = @"app cell";
    CandouAppCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[CandouAppCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    
    AppModel *model = [_dataArray objectAtIndex:indexPath.row];
    
    //测试用
    //cell.textLabel.text = model.name;
    
    [cell.iconImageView setImageWithURL:[NSURL URLWithString:model.iconUrl]];
    cell.nameLabel.text = model.name;
    cell.descriptionLabel.text = model.description;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100.0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
