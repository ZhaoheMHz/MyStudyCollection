//
//  ViewController.m
//  02-新闻
//
//  Created by 哲 肖 on 16/2/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"
#import "GPNews.h"
#import "GPLargeCell.h"
#import "GPListCell.h"
#import "GPOriginCell.h"
#import "GPAppCell.h"

#import "GPNewsCellFactory.h"
#import "GPNewsFactory.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>


@property (nonatomic, copy)NSArray * newsArray;

@end

@implementation ViewController


- (NSArray *)newsArray
{
    if(_newsArray == nil)
    {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"news.plist" ofType:nil];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * objs = [NSMutableArray array];
        for(NSDictionary * dict in dictArray)
        {
            GPNews * news = [GPNewsFactory newsWithDict:dict];//[GPNews newsWithDict:dict];
            [objs addObject:news];
        }
        _newsArray = objs;
    }
    return _newsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    
    UITableView * tableView = [[UITableView alloc] init];
    [self.view addSubview:tableView];
    tableView.frame = self.view.bounds;
    tableView.dataSource = self;
    tableView.delegate = self;
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.newsArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [GPNewsCellFactory cellWithTableView:tableView news:self.newsArray[indexPath.row]];
}

#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GPNews * news = self.newsArray[indexPath.row];
    return news.rowHeight;
    
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}



@end
