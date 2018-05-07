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

@interface ViewController ()<UITableViewDataSource>

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
    
    //整体设置,所有行的高度
    tableView.rowHeight = 150;
    
    
    
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
    GPFriend * friend = self.friendArray[indexPath.row];
    
    /*
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@""];
    */
    
    //使用alloc init方式创建的cell对象,当离开屏幕的时候,会立即被销毁
    //alloc init方式创建的cell对象 不会被放到缓存池中去
//    MyTableViewCell * cell = [[MyTableViewCell alloc] init];
    
    //reuseIdentifier 方式创建的cell 完全离开屏幕的时候,会立即被放到缓存池中,备用
    //reuseIdentifier 标记当前cell属于哪一种类型的cell,方便我们在重用的时候,使用相同的标记,找到同一类型的cell然后进行重用
    
    NSString * Identifier = @"abc";
    
    //1.去缓存池中找,某一类型的cell,如果有可重用的,那么返回该cell对象,如果没有,返回nil
    MyTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if(cell == nil)
    {
        //使用了缓存技术,内存中最多驻留,屏幕显示条数 + 1个cell对象
        cell =  [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:Identifier];
       
        NSLog(@"%p ",cell);
    }
    
    cell.icon.image = [UIImage imageNamed:friend.icon];
    cell.titleNameLabel.text = friend.name;
    

    
//    for(UIView * subView in cell.subviews)
//    {
//        [subView removeFromSuperview];
//    }
    
    //1.把子控件的创建,挪到tableviewcell内部
    //2.保证子控件只创建一次
    
//    UIImageView * icon = [[UIImageView alloc] init];
//    [cell addSubview:icon];
//    icon.frame = CGRectMake(0, 40, 70, 70);
//    icon.image = [UIImage imageNamed:friend.icon];
//    
//    UILabel * titleNameLabel = [[UILabel alloc] init];
//    [cell addSubview:titleNameLabel];
//    titleNameLabel.frame = CGRectMake(80, 40, 100, 30);
//    titleNameLabel.text = friend.name;

    
    
    /*
    cell.textLabel.text = friend.name;//@"test";
    cell.imageView.image = [UIImage imageNamed:friend.icon];
    cell.detailTextLabel.text = friend.message;
    
//    NSLog(@"cellForRowAtIndexPath");
    */
    
    
    
    return cell;
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
