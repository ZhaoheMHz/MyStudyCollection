//
//  ViewController.m
//  02-级联操作
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, copy)NSArray * cityPlist;

@property (nonatomic, weak)UITableView * cityTableView;
@property (nonatomic, weak)UITableView * areaTabelView;
@property (nonatomic, copy)NSArray * areaArray;

@end

@implementation ViewController

- (NSArray *)cityPlist
{
    if(_cityPlist == nil)
    {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"city.plist" ofType:nil];
        _cityPlist = [NSArray arrayWithContentsOfFile:path];
    }
    return _cityPlist;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView * cityTableView = [[UITableView alloc] init];
    [self.view addSubview:cityTableView];
    cityTableView.dataSource = self;
    cityTableView.delegate = self;
    cityTableView.frame = CGRectMake(0, 0, self.view.frame.size.width * 0.5, self.view.frame.size.height);
    self.cityTableView = cityTableView;
    
  
    UITableView * areaTabelView = [[UITableView alloc] init];
    [self.view addSubview:areaTabelView];
    areaTabelView.dataSource = self;
    areaTabelView.delegate = self;
    areaTabelView.frame = CGRectMake(self.view.frame.size.width * 0.5, 0, self.view.frame.size.width * 0.5, self.view.frame.size.height);
    self.areaTabelView = areaTabelView;
    
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView == self.cityTableView){
        return self.cityPlist.count;
    }
    else if(tableView == self.areaTabelView)
    {
//        return 20;
        return self.areaArray.count;
    }
    return 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView == self.cityTableView)
    {
        //如果取出字典的key值
        NSDictionary * dict = self.cityPlist[indexPath.row];
        NSArray * allKeys = [dict allKeys];
        NSString * cityName = [allKeys lastObject];
        
        UITableViewCell * cell = [[UITableViewCell alloc] init];
        cell.textLabel.text = cityName;
        
        return cell;
    }
    else if(tableView == self.areaTabelView)
    {
        UITableViewCell * cell = [[UITableViewCell alloc] init];
        cell.textLabel.text = self.areaArray[indexPath.row];
        return cell;
    }
    return nil;
}//end method

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.点击了cityTaleView时,填充第二areaTableView中的数据
    if(tableView == self.cityTableView)
    {
            //1.取出要填充的数据内容(数组)
        NSDictionary * dict = self.cityPlist[indexPath.row];
        NSArray * allValues = [dict allValues];
        self.areaArray = [allValues lastObject];
            //2.刷新areaTableView数据
        [self.areaTabelView reloadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
