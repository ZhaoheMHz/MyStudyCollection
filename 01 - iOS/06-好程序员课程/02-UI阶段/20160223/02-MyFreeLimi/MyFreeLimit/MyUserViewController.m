//
//  MyUserViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-4-12.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "MyUserViewController.h"


#import "NetInterface.h"
#import "CategoryModel.h"
#import "DataCenter.h"
#import "AppModel.h"

#import "AFNetworking.h"

@interface MyUserViewController ()
{
    UILabel *_downloadInfoLabel;
    UILabel *_browseInfoLabel;
    UILabel *_limitInfoLabel;
    
    
}
@end

@implementation MyUserViewController

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
    
    self.navigationItem.title = @"我的账户";
    self.view.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
    
    // user_background.png 302X236
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(9, 10, 302, 236)];
    bg.image = [UIImage imageNamed:@"user_background.png"];
    [self.view addSubview:bg];
    
    //添加到bg中的控件
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 42, 80, 30)];
    titleLabel.text = @"账户信息";
    titleLabel.font = [UIFont systemFontOfSize:14];
    titleLabel.textColor = [UIColor whiteColor];
    [bg addSubview:titleLabel];
    
    
    //user_download.png
    UIImageView *downloadImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 95, 23, 23)];
    downloadImageView.image = [UIImage imageNamed:@"user_download.png"];
    [bg addSubview:downloadImageView];
    
    
    //更新下载信息
    int downloadCount = [[DataCenter sharedInstance] getAppDownloadCount];
    double allLessPrice = 0;
    NSArray *downArray = [[DataCenter sharedInstance] getAllDownloadArray];
    for (AppModel *model in downArray) {
        allLessPrice += model.lastPrice.doubleValue - model.currentPrice.doubleValue;
    }
    
    _downloadInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 95, 300, 30)];
    _downloadInfoLabel.text = [NSString stringWithFormat:@"你下载了%d款应用,共节省了$%.2f",downloadCount,allLessPrice];
    _downloadInfoLabel.font = [UIFont systemFontOfSize:14];
    [bg addSubview:_downloadInfoLabel];
    
    
    
    
    //user_browse.png
    UIImageView *browseImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 140, 23, 23)];
    browseImageView.image = [UIImage imageNamed:@"user_browse.png"];
    [bg addSubview:browseImageView];
    
    //获取浏览信息
    NSArray *browseArray = [[DataCenter sharedInstance] getAllBrowseArray];
    allLessPrice = 0;
    for (AppModel *model in browseArray) {
        allLessPrice += model.lastPrice.doubleValue - model.currentPrice.doubleValue;
    }
    
    _browseInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 140, 300, 30)];
    _browseInfoLabel.text = [NSString stringWithFormat:@"你浏览了%d款应用总计$%.2f",browseArray.count,allLessPrice];
    _browseInfoLabel.font = [UIFont systemFontOfSize:14];
    [bg addSubview:_browseInfoLabel];
    
    
    //user_total.png
    UIImageView *totolImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 185, 23, 23)];
    totolImageView.image = [UIImage imageNamed:@"user_total.png"];
    [bg addSubview:totolImageView];
    
    
    _limitInfoLabel = [[UILabel alloc] initWithFrame:CGRectMake(35, 185, 300, 30)];
    _limitInfoLabel.text = [NSString stringWithFormat:@"当前限免%d款应用总计$%.2f",4,185.0];
    _limitInfoLabel.font = [UIFont systemFontOfSize:14];
    [bg addSubview:_limitInfoLabel];
    
    
    //下载数据
    [self startDownloadData];

    
}

#pragma mark - 数据解析

-(void)startDownloadData
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:MYUSER_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //转换为数组
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        // category
        //
        /*
         {
         "categoryId": "6000",
         "categoryName": "Business",
         "count": "1066",
         "lessenPrice": "57443"
         }
         */
        
        
        NSDictionary *allCategoryDict = [dict[@"category"] lastObject];
        int appAllCount = [allCategoryDict[@"count"] intValue];
        double appAllLessenPrice = [allCategoryDict[@"lessenPrice"] doubleValue];
        
        
        //NSLog(@"ac = %d, al = %f",appAllCount,appAllLessenPrice);
        _limitInfoLabel.text = [NSString stringWithFormat:@"你浏览了%d款应用总计$%.2f",appAllCount,appAllLessenPrice];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
