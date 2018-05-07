//
//  ViewController.m
//  00_HomeWork
//
//  Created by baoxu on 15/11/27.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "MyConnection.h"
#import "CellView.h"
#import "CellModel.h"
#import "NSString+Hashing.h"

/**
 *  需求分析
 1.需求：异步加载图片，使用tableView展示出来，用到代理，缓存。。。
 2.实现：
 a> 纵向（MVC）
 M：url，name （网络下载类）
 C：controller
 V：cell
 b> 横向
 cell 模块 UI（有lable，有imageView）
 下载类 模块 实现过程（通过代理传值，Connection下载）
 */
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,MyConnectionDelegate>
{
    //存放URL
    NSString *myURLStr;
    //存放URL返回的数据
    NSMutableData *myURLData;
    //存放整理出来图片的URL
    NSMutableArray *myURLJsonArray;
    
    UITableView *myTableView;
    NSMutableArray *myCellDataArray;
    
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    myCellDataArray = [[NSMutableArray alloc]init];
    
    myURLJsonArray = [[NSMutableArray alloc]init];
    
    myURLData = [[NSMutableData alloc]init];
    
    myURLStr  = @"http://api.breadtrip.com/trips/hot?";
    
    NSURL *url = [NSURL URLWithString:myURLStr];
    [self downloadAsyncWithBlock:url];
    
    
}

#pragma  mark -展示TableView-
-(void)createTableView{
    myTableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:myTableView];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (myCellDataArray.count>0) {
        return myCellDataArray.count;
    }
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellId = @"cellId";
    CellView *cellView = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cellView) {
        cellView = [[CellView alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cellView.titleLabel.text = nil;
    cellView.cellImageView.image = nil;
    cellView.progressView.hidden = YES;
    
    
    CellModel *itemModel = [myCellDataArray objectAtIndex:indexPath.row];
    cellView.titleLabel.text = [NSString  stringWithFormat:@"%@",itemModel.cellTitle];
    
    NSFileManager *fm =[NSFileManager defaultManager];
    
    NSString *filePath = [NSString stringWithFormat:@"%@/tmp/%@",NSHomeDirectory(),[itemModel.imageUrl MD5Hash]];
    
    if ([fm fileExistsAtPath:filePath]) {
        NSLog(@"从本地获取");
        NSData *data = [NSData dataWithContentsOfFile:filePath];
        cellView.cellImageView.image = [UIImage imageWithData:data];
        
        //文件的删除
//        [fm removeItemAtPath:filePath error:nil];
        
    }else{
    
        MyConnection *con = [[MyConnection alloc]initWithUrl:itemModel.imageUrl Delegate:self];
        con.tag = indexPath.row;
        cellView.progressView.hidden = NO;
    }
//    cellView.cellImageView.image
    
    
    return cellView;
}

#pragma mark -代理方法-
-(void)downloadFinish:(MyConnection *)con Data:(NSData *)data{
    NSIndexPath *indeXPath = [NSIndexPath indexPathForRow:con.tag inSection:0];
    
    CellView *cell = [myTableView cellForRowAtIndexPath:indeXPath];
    cell.progressView.hidden = YES;
    cell.cellImageView.image = [UIImage imageWithData:data];

    NSString *filePath = [NSString stringWithFormat:@"%@/tmp/%@",NSHomeDirectory(),[con.url MD5Hash]];
    
    //保存
    [data writeToFile:filePath atomically:NO];
}
-(void)downloadFail:(MyConnection *)con{

    NSIndexPath *indeXPath = [NSIndexPath indexPathForRow:con.tag inSection:0];
    
    CellView *cell = [myTableView cellForRowAtIndexPath:indeXPath];
    cell.progressView.hidden = YES;
    NSLog(@"下载失败");
    
}
-(void)downloadDidReceive:(MyConnection *)con Progress:(float)progress{
    NSIndexPath *indeXPath = [NSIndexPath indexPathForRow:con.tag inSection:0];
    
    CellView *cell = [myTableView cellForRowAtIndexPath:indeXPath];
    cell.progressView.hidden = NO;
    cell.progressView.progress = progress;
    con = nil;
}


#pragma  mark -获取json数据-
-(void)downloadAsyncWithBlock:(NSURL *)url{
  
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (!connectionError && data) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            NSArray *array = [dic objectForKey:@"trips"];
            
            for (NSDictionary *dict in array) {
                //获取imageURl
                NSString *imageUrl = [dict objectForKey:@"cover_image"];
                //获取title
                NSString *title = [dict objectForKey:@"name"];
                //交给model
                CellModel *celModel = [[CellModel alloc]init];
                celModel.cellTitle = title;
                celModel.imageUrl = imageUrl;
                
                //将数据模型添加到数组
                [myCellDataArray addObject:celModel];
                
            }
            
            //可以展示tableView
            [self createTableView];
            
        }else{
            NSLog(@"%@",connectionError);
        }
    }];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
