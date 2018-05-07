//
//  CategoryViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "CategoryViewController.h"

#import "NetInterface.h"
#import "CategoryModel.h"

#import "CategoryModel.h"
#import "CategoryCell.h"


#import "UIView+QFExt.h"
#import "UIImageView+AFNetworking.h"

#import "AFNetworking.h"


@interface CategoryViewController ()
{
    //数据
    NSMutableArray *_dataArray;
    
    //表格
    UITableView *_tableView;
    
    
}
@end

@implementation CategoryViewController


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
    
    //初始化数组
    _dataArray = [[NSMutableArray alloc] init];
    
    
    //创建tableView
    // 480-44-44
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-44-44) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    //下载数据, 异步更新
    [self startDownloadData];
    
}

#pragma mark - 数据下载和解析

-(void)startDownloadData
{
    // 显示一个HUB进度表 显示....
 
    
    
    //开始下载
    NSString *url = [NSString stringWithFormat:CATE_URL];
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //此处设置后返回的默认是NSData的数据
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:CATE_URL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        /*  分类数据格式
         
         [
         {
         "category_count": "1114651",
         "free": "673192",
         "same": "190142",
         "down": "30308",
         "limited": "49607",
         "up": "171402",
         "category_name": "All",
         "category_cname": "全部"
         },
         ]
         */
        
        //转换为数组
        NSArray *categoryArray = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        //NSLog(@"categoryArray = %@",categoryArray);
        
        for (NSDictionary *cateDict in categoryArray) {
            
            CategoryModel *model = [[CategoryModel alloc] init];
            
            for (NSString *key in cateDict) {
                [model setValue:cateDict[key] forKey:key];
            }
            
            [_dataArray addObject:model];
            
            /*
             NSLog(@"id = %@ catename = %@, cname = %@",
             model.categoryId,
             model.categoryName,
             model.categoryCname);
             */
            
        }
        
        
        [_tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
}



#pragma mark - 表格显示

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
    CategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[CategoryCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    CategoryModel *model = [_dataArray objectAtIndex:indexPath.row];
    NSString *imageFile = [NSString stringWithFormat:@"category_%@.jpg",model.category_name];
    cell.iconImageView.image = [UIImage imageNamed:imageFile];
    [cell.iconImageView makeCorner:10];
    
    cell.categoryNameLabel.text = model.category_cname;
    cell.categoryDetailLabel.text = [NSString stringWithFormat:@"共有%@款应用, 其中限免%@款",model.category_count,model.free];
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80.0;
}


#pragma mark - 表格事件的处理

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    CategoryModel *model = [_dataArray objectAtIndex:indexPath.row];
    
    //通知传值
    //[[NSNotificationCenter defaultCenter] postNotificationName:@"ChangeCategoryId" object:nil userInfo:@{@"id":model.category_id}];
    
    _changeCategory(model.category_id);
    
    
    
    //返回原来的界面
    [self.navigationController popViewControllerAnimated:YES];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
