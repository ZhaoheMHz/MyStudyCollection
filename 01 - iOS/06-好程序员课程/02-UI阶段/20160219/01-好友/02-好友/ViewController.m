//
//  ViewController.m
//  02-好友
//
//  Created by 哲 肖 on 16/2/17.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"
#import "GPFriend.h"
#import "MyTableViewCell.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic, copy)NSArray * friendArray;

@end

@implementation ViewController


- (NSArray *)friendArray
{
    if(_friendArray == nil)
    {
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"friends.plist" ofType:@""];
        NSArray * dcitArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * objs = [NSMutableArray array];
        for(NSDictionary * dict in dcitArray)
        {
            GPFriend * friend = [GPFriend friendWithDict:dict];
            [objs addObject:friend];
        }
        
        _friendArray = objs;
        
    }
    return _friendArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    //整体设置,所有行的高度
//    tableView.rowHeight = 150;
    
    //设置背景颜色
//    tableView.backgroundColor = [UIColor redColor];
    UIImageView * imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"img_background.jpg"];
    tableView.backgroundView = imageView;
    
    //设置分割线为no
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    
    UIView * headerView = [[UIView alloc] init];
    headerView.backgroundColor = [UIColor greenColor];
    headerView.frame = CGRectMake(0, 0, 375, 200);
    tableView.tableHeaderView = headerView;

    tableView.tableFooterView = [UIButton buttonWithType:UIButtonTypeInfoLight];
    
    
    
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    return 10;
    return self.friendArray.count;
}
//cellForRowAtIndexPath 会被调用多少次?(最少一次性调用屏幕能够显示的条数)
//内存中会有多少个UITableViewCell对象?
// 最多有屏幕显示 + 1个cell对象

//UITableView使用中最消耗性能的问题是什么?
//1.cup运转 (alloc dealloc操作),带来的问题(电量消耗大,手机发热就大)
//2.内存占用量

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    MyTableViewCell * cell = [MyTableViewCell myTableViewCellWithTableView:tableView];
    cell.Friend = self.friendArray[indexPath.row];//friend;
   
    //设置cell的背景颜色
    cell.backgroundColor = [UIColor grayColor];
    UIImageView * backgroundImageView = [[UIImageView  alloc] init];
    backgroundImageView.image = [UIImage imageNamed:@"selected_background"];
//    cell.backgroundView = backgroundImageView;
    
    //设置选中状态下的背景图片
//    cell.selectedBackgroundView = backgroundImageView;
    
    //用户提示
//    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    cell.accessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
    
    return cell;
}

#pragma mark UITableViewDelegate
//当点击了某一个cell中的辅助提示视图,会被调用
- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"accessoryButtonTappedForRowWithIndexPath");
}

//当点击了某一行cell的时候会被主动调用
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"didSelectRowAtIndexPath %@",indexPath);
}

//需要设置某些特殊cell高度的时候应用
//要注意,不要随意的应用该方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
    {
        return 50;
    }
    return 200;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
