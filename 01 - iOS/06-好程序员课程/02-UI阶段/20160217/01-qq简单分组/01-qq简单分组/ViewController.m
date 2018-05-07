//
//  ViewController.m
//  01-qq简单分组
//
//  Created by 哲 肖 on 16/2/17.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"
#import "GPGroup.h"

//UITableViewDataSource 协议
//DataSource 代表数据源,(我们想要TableView显示什么样的数据,都要通过数据源协议中定义的方法,告诉tableView组件)

@interface ViewController ()<UITableViewDataSource>

@property (nonatomic, copy)NSArray * groupArray;

@end

@implementation ViewController

- (NSArray *)groupArray
{
    if(_groupArray == nil)
    {
        
        NSString * path = [[NSBundle mainBundle] pathForResource:@"qq_group_simple.plist" ofType:@""];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray * objs = [NSMutableArray array];
        for(NSDictionary * dict in  dictArray)
        {
            GPGroup * group = [GPGroup groupWithDict:dict];
            [objs addObject:group];
        }
        _groupArray = objs;
    }
    
    return _groupArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //继承自UIScrollView
    //UITableViewStylePlain (列表样式)
    //UITableViewStylePlain分组效果,头部标题有悬停效果
    
    //UITableViewStyleGrouped (有明显分组效果的样式)
    //两种样式都能够分组,只不过是分组显示的效果不同而已
    //UITableViewStyleGrouped分组,组与组之间有明显的分隔效果
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    
    //想要正确的显示出来数据,要保证两点
    //1.设置了tableview的协议实现对象
    //2.实现datasource协议中必须要实现的方法
    //必须实现以下两个协议方法,不实现就报错
    //numberOfRowsInSection
    //cellForRowAtIndexPath
    tableView.dataSource = self;
    
}


#pragma mark UITableViewDataSource
//要想正确显示数据,必须要实现哪些方法
//系统协议设计的原则是什么?

//1.你要让tableview显示多少组数据?
//可以不实现,默认值是1
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
//    return 2;
    return self.groupArray.count;
}
//2.每一组有多少行数据?
//如果有多组,怎么回答这个问题?
//必须要实现的协议方法
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //section 根据numberOfSectionsInTableView 方法的返回值,返回n - 1
    //section 0,1
    
    //section 第几组
    
    GPGroup * group = self.groupArray[section];
    NSArray * firends = group.friends;
    return firends.count;

//    return 10;
}
//3.每一组的每一行,显示什么样的具体数据?
//UITableViewCell 继承自UIView的特殊视图
//一个UITableViewCell就代表,UITableView中的一行数据

//cellForRowAtIndexPath 会被调用多少次呢?
//必须要实现的方法
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //哪一组?indexPath.section
    //哪一行?indexPath.row
    //section = 0 row = 0 ...... section = 0 ,row = 4
    //section = 1 row = 0 ...... section = 1 ,row = 4
    
    GPGroup * gorup = self.groupArray[indexPath.section];
    NSArray * firends = gorup.friends;
    
    NSString * name = firends[indexPath.row];
    
    UITableViewCell * cell = [[UITableViewCell alloc] init];
    
    //cell中默认提供了以个显示文本的标签对象属性
    cell.textLabel.text = name;//@"adf";
    
    return cell;
    
}

//哪一组的title显示什么内容
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    GPGroup * group = self.groupArray[section];
    return group.title;
    
    /*
    if(section == 0)
    {
        return @"第一组数据头部";
    }
    else
    {
        return @"第二组数据头部";
    }
     */
}


//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    if(section == 0)
//    {
//        return @"第一组数据尾部";
//    }
//    else
//    {
//        return @"第二组数据尾部";
//    }
//}

//隐藏状态栏方法,系统自动调用
- (BOOL)prefersStatusBarHidden
{
    return YES;
}


@end
