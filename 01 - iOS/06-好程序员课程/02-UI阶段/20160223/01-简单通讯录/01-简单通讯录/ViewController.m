//
//  ViewController.m
//  01-简单通讯录
//
//  Created by 哲 肖 on 16/2/23.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"
#import "GPGroup.h"
/*
 
 无论是(数据库,网络的数据,plist的数据),最终想要在我们的程序中能够应用这些数据,都要把他们转换成,OC中的数据类型
 
 */

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate>


@property (nonatomic, copy)NSArray * groupArray;
@property (nonatomic, weak)NSIndexPath * currentSelectedIndexPath;

@property (nonatomic, weak)UITableView * tableView;

@end

@implementation ViewController

- (NSArray *)groupArray
{
    if(_groupArray == nil)
    {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"address_list.plist" ofType:nil];
        NSArray * dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray * objs = [NSMutableArray array];
        
        for(NSDictionary * dict in dictArray)
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

    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    self.tableView = tableView;
    
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.groupArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    GPGroup * group = self.groupArray[section];
    return group.names.count;

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //系统默认UITableViewCell的重用
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    GPGroup * group = self.groupArray[indexPath.section];
    NSArray * names = group.names;
    
    cell.textLabel.text = names[indexPath.row];
    

    
    return cell;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    GPGroup * group = self.groupArray[section];
    return group.title;
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
//    return @[@"A",@"B",@"9",@"1"];
    
    /*
    NSMutableArray * objs = [NSMutableArray array];
    for(GPGroup * group in self.groupArray)
    {
        [objs addObject:group.title];
    }
    
    return objs;
     */
    //利用kvc的方式,在数组中,取出数组中存储模型的某一个具体属性值,并且他会把这些值组成一个新的数组返回来
    return [self.groupArray valueForKey:@"title"];
    
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //1.弹出提示框,让用户进行数据的输入
    
    //保存当前选中的行indexPath信息
    self.currentSelectedIndexPath = indexPath;
    
    UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"修改用户名称" message:@"输入正确的用户名称" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    //弹出带输入框的模态视图
    alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    [alertView show];
    
    
}

#pragma mark UIAlertViewDelegate
//当点击了UIAlertView上的任意按钮的时候,就会调用该方法
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //当用户点击了取消按钮的时候什么操作都不做
    if(buttonIndex == 0) return;
    
    //如果用户点击了确定按钮
    // 更新TableView中,某一组,某一行的数据
    // 更新模型
    // 1.获得用户输入的数据
    //在alertView中,获得UITextField对象,并且出去UITextField中存储的字符串数据内容
    UITextField * textField = [alertView textFieldAtIndex:0];
    NSString * newNameValue = textField.text;
    
    // 2.获得对应行的模型,把用户输入的数据修改进去
    GPGroup * group = self.groupArray[self.currentSelectedIndexPath.section];
    
    NSMutableArray * objs = [NSMutableArray arrayWithArray:group.names];
    
    //删除掉,对应位置的旧的数据
    [objs removeObjectAtIndex:self.currentSelectedIndexPath.row];
    //在对应位置添加新的数据
    [objs insertObject:newNameValue atIndex:self.currentSelectedIndexPath.row];
    //把构造 出来的新数组,同步到对应的模型中去,替换掉原来的names数组
    group.names = objs;
    
    // 刷新tableview
//    [self.tableView reloadData];
    //针对某一行的数据,进行局部更新,要比reloadData效率高一些
    //选中了那一行数据,需要更新的就是那一行数据
    NSArray * indexPaths = @[self.currentSelectedIndexPath];
    [self.tableView reloadRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationBottom];
    
    
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //1.数据源数组中,更新数据源内容
    GPGroup * group = self.groupArray[indexPath.section];
    NSMutableArray * objs = [NSMutableArray arrayWithArray:group.names];
    [objs removeObjectAtIndex:indexPath.row];
    group.names = objs;
    
    //2.删除cell
    NSArray * indexPaths = @[indexPath];
    [tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationNone];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return @"删除";
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
