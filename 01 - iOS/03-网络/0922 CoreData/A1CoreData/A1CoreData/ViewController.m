//
//  ViewController.m
//  A1CoreData
//
//  Created by 赵赤赤 on 15/9/22.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

#define k_student @"Student"

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

{
    NSMutableArray *_dataArray;
    
    // 被管理对象上下文(操作数据的环境)
    NSManagedObjectContext *_moc;
    
    // 记录选中的cell的行数
    NSInteger _currentRow;
}

@property (weak, nonatomic) IBOutlet UITextField *nameTF;
@property (weak, nonatomic) IBOutlet UITextField *ageTF;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = [[NSMutableArray alloc] init];
    
    _currentRow = -1;

    
    /** 
     * coreData的相关设置
     */
    // 找到coreData文件的路径,     ***文件后缀用"momd"***
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Qianfeng" ofType:@"momd"];
    
    // 被管理对象模型(对应的就是coreData文件)     ***[NSURL fileURLWithPath:path]***
    NSManagedObjectModel *model = [[NSManagedObjectModel alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path]];
    
    // 持久化存数协调器(可以管理模型)
    NSPersistentStoreCoordinator *coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:model];
    
    // 需要关联的数据库的路径
    NSString *sqlPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/qf.sqlite"];
    
    NSError *error = nil;
    // 通过协调器设置数据存储方式(sqlite),返回值用来判断关联数据库是否成功
    NSPersistentStore *store = [coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[NSURL fileURLWithPath:sqlPath] options:nil error:&error];
    if (!store) {
        NSLog(@"add = %@", error);
    }
    
    // 管理数据的对象
    _moc = [[NSManagedObjectContext alloc] init];
    
    // 关联持久化存储协调器
    _moc.persistentStoreCoordinator = coordinator;
    /**************环境搭建完毕,下午起飞,灵车飘逸,墓碑冲浪****************/
    
    
    // 创建查询请求
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:k_student];
    error = nil;
    
    // 执行查询请求
    NSArray *arr = [_moc executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"fetch = %@", error);
    }
    else {
        _dataArray.array = arr;
    }
}

- (IBAction)btnClick:(UIButton *)sender {
    [self.view endEditing:YES];
    
    NSError *error = nil;
    
    switch (sender.tag) {
        case 101:
        {
            // 向coreData中插入一个实体,返回值就是这个实体的指针
            Student *dent = [NSEntityDescription insertNewObjectForEntityForName:k_student inManagedObjectContext:_moc];
            
            // 赋值
            dent.name = self.nameTF.text;
            dent.age = @(self.ageTF.text.intValue);
            
            // 同步并且判断是否成功
            if ([_moc save:&error]) {
                [_dataArray addObject:dent];
                [_tableView reloadData];
            }
            else {
                NSLog(@"insert = %@", error);
            }
        }
            break;
        case 102:
        {
            if (_currentRow < 0) {
                return;
            }
            
            Student *dent = _dataArray[_currentRow];
            
            [_moc deleteObject:dent];
            
            if ([_moc save:&error]) {
                [_dataArray removeObjectAtIndex:_currentRow];
                [_tableView reloadData];
            }
            else {
                NSLog(@"delete = %@", error);
            }
        }
            break;
        case 103:
        {
            if (_currentRow < 0) {
                return;
            }
            
            Student *dent = _dataArray[_currentRow];
            dent.name = _nameTF.text;
            dent.age = @(_ageTF.text.intValue);
            if ([_moc save:&error]) {
                [_tableView reloadData];
            }
            else {
                NSLog(@"update = %@", error);
            }
        }
            break;
        case 104:
        {
            // 查询请求
            NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:k_student];
            
            // 查询条件
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@", [NSString stringWithFormat:@"*%@*", _nameTF.text]];
            
            // 将条件和请求绑定
            [request setPredicate:predicate];
            
            _dataArray.array = [_moc executeFetchRequest:request error:nil];
            
            [_tableView reloadData];
        }
            break;
        default:
            break;
    }
    
    _currentRow = -1;
}

#pragma mark - tableView
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"qqq"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"qqq"];
    }
    
    Student *dent = _dataArray[indexPath.row];
    cell.textLabel.text = dent.name;
    cell.detailTextLabel.text = dent.age.stringValue;
    
    return cell;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

// 点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _currentRow = indexPath.row;
    Student *dent = _dataArray[indexPath.row];
    _nameTF.text = dent.name;
    _ageTF.text = dent.age.stringValue;
}

@end
