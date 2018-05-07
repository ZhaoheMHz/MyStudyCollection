//
//  MySettingViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "MySettingViewController.h"

@interface MySettingViewController ()
{
    //数据源
    NSMutableArray *_dataArray;
    
    //显示数据tableView
    UITableView *_tableView;
    
}
@end

@implementation MySettingViewController

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
    
    self.navigationItem.title = @"我的设置";
    
    
    //设置数据源
    _dataArray = [[NSMutableArray alloc] init];
    NSArray *pushArray = [[NSArray alloc] initWithObjects:@"推送设置",@"开启推送通知",@"开启关注通知", nil];
    [_dataArray addObject:pushArray];
    
    NSArray *infoArray = [[NSArray alloc] initWithObjects:@"推荐爱限免",@"官方推荐",@"官方微博",@"版本 V1.8.1",@"感谢使用爱限免应用", nil];
    [_dataArray addObject:infoArray];
    
    //tableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 480-44-44) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    
}

#pragma mark - 表格显示想关

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _dataArray.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_dataArray[section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    
    NSString *str = _dataArray[indexPath.section][indexPath.row];
    cell.textLabel.text = str;
    
    //如果 section == 0, row = 1,2, 添加一个UISwitch
    if(indexPath.section == 0 && (indexPath.row == 1 || indexPath.row == 2))
    {
        UISwitch *mySwitch = [[UISwitch alloc] initWithFrame:CGRectMake(250, 5, 60, 30)];
        mySwitch.on = NO;
        [cell addSubview:mySwitch];
    }
    
    
    return cell;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
