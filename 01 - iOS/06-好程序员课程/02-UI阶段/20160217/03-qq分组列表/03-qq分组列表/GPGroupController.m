//
//  GPGroupController.m
//  03-qq分组列表
//
//  Created by 哲 肖 on 15/11/11.
//  Copyright (c) 2015年 肖喆. All rights reserved.
//

#import "GPGroupController.h"
#import "GPGroup.h"
#import "GPFriend.h"
#import "NSArray+local.h"
#import "GPHeaderView.h"
#import "GPFriendCell.h"

@interface GPGroupController()<UITableViewDataSource,UITableViewDelegate,GPHeaderViewDelegate>

//2.准备模型数据
@property(nonatomic,strong)NSArray * groupArray;

@property(nonatomic,weak) UITableView * tableView ;

@end

@implementation GPGroupController

- (NSArray *)groupArray
{
    if(_groupArray == nil)
    {
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"qq_group.plist" ofType:nil];
        NSArray * tmp = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * objs = [NSMutableArray array];
        for(NSDictionary * tmpdict in tmp)
        {
            GPGroup * group = [GPGroup groupWithDict:tmpdict];
            [objs addObject:group];
        }
        
        _groupArray = objs;
        
    }
    return _groupArray;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    //1.创建
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    //2.设置数据源对象
    tableView.dataSource = self;
    
    //3.设置代理对象
    tableView.delegate = self;

    
}

#pragma mark UITableViewDataSource

//1.显示几组数据?
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groupArray.count;
}

//2.每组中有多少行数据?
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    GPGroup * group = self.groupArray[section];
    return  group.expand?group.friends.count:0;
}

//3.每一组,中的每一行,显示什么样的内容?
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    GPGroup * group = self.groupArray[indexPath.section];
    GPFriend * friend = group.friends[indexPath.row];//0 - friend.count - 1
    
    /*
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    cell.textLabel.text = friend.name;
    cell.imageView.image = [UIImage imageNamed:friend.icon];
    return cell;
     */
    
    GPFriendCell  * cell = [GPFriendCell friendCellWithTableView:tableView];
    cell.myFriend = friend;
    
    return cell;
}

//4.分组标题
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    GPGroup * group = self.groupArray[section];
//    
//    return group.title;
//}


#pragma mark UITableViewDelegate

//返回自定义的组标题视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{


    GPGroup * group = self.groupArray[section];
    GPHeaderView * headerView = [GPHeaderView headerViewWithTableView:tableView];
    
    NSLog(@"%p",headerView);
    headerView.group = group;
    
    //设置当前控制器为代理对象
    headerView.delegate = self;
    
    return headerView;
    
}

//设置自定义的组头部视图的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

- (void)headerView:(GPHeaderView *)headerView Status:(BOOL)expand
{
    NSLog(@"headerView expand");
    
    //刷新tableView
    
    //直接导致,所有的数据源方法,重新调用一边
    //只要一到用reloadData 之前缓存池中的所有可重用的cell headerView对象都会被释放掉
    //然后重新创建reloadData 好像是重新创建了一个新的tableveiw
    [self.tableView reloadData];
    
    
}

//隐藏,状态栏
- (BOOL)prefersStatusBarHidden{
    return YES;
}


@end
