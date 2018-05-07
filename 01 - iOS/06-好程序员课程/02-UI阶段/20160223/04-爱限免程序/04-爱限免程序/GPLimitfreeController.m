//
//  GPLimitfreeController.m
//  04-爱限免程序
//
//  Created by 哲 肖 on 16/2/23.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPLimitfreeController.h"
#import "GPApp.h"
#import "GPAppCell.h"
#import "AFHTTPRequestOperationManager.h"

@interface GPLimitfreeController ()<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, copy)NSArray * appArray;

@end

@implementation GPLimitfreeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self startDownloadData];
    
    
    
    
}

#pragma mark UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.appArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPApp * app = self.appArray[indexPath.row];
    
    GPAppCell * cell = [GPAppCell appCellWithTableView:tableView];
    
    cell.app = app;
    return cell;
    
}

-(void)startDownloadData
{

    //注意: 程序刚开始的时候不需要显示, 显示则显示位置有问题
    NSString *urlString = @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=1&category_id=";nil;//[NSString stringWithFormat:self.urlstring,_currentPage,self.categoryId];
    
    NSLog(@"urlString = %@",urlString);
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        //在真实的企业开发中,模型中有哪些属性,要参考
        //1.开发文档
        //2.接口返回的json数据/xml数据
        /*
         
         //根据字典中的key,去设置模型的属性
         applicationId = 455680974;
         categoryId = 6014;
         categoryName = Game;
         currentPrice = 0;
         description = "aabc";
         downloads = 4235;
         expireDatetime = "2016-02-24 06:37:24.0";
         favorites = 273;
         fileSize = "16.69";
         iconUrl = "http://photo.candou.com/i/114/55b07f3725eae8b3cafc9bce10d16e46";
         ipa = 1;
         itunesUrl = "http://itunes.apple.com/cn/app/rhythm-repeat/id455680974?mt=8";
         lastPrice = 12;
         name = "\U8282\U594f\U91cd\U590d";
         priceTrend = limited;
         ratingOverall = 0;
         releaseDate = "2014-07-01";
         releaseNotes = "Multi-Touch bug fixed";
         shares = 390;
         slug = "rhythm-repeat";
         starCurrent = "4.0";
         starOverall = "4.0";
         updateDate = "2014-10-17 15:45:27";
         version = "2.3";
         },

         
         */
        //转换为词典数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
//        NSLog(@"返回的字典数据 %@",dict);
        NSArray * dictArray = [dict objectForKey:@"applications"];
        
        NSMutableArray * objs = [[NSMutableArray alloc] init];
        
        for (NSDictionary * dict in dictArray)
        {
            GPApp * app = [GPApp appWithDict:dict];
            [objs addObject:app];
        }
        
        //1.把封装好的模型数组,保存全局
        self.appArray = objs;
        
        NSLog(@"%@",self.appArray);
        
        //2.tableView刷新数据源
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
