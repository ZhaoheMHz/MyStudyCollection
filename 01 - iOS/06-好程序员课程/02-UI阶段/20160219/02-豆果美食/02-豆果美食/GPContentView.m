//
//  GPContentView.m
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPContentView.h"
#import "GPSubject.h"
#import "GPSubjectCell.h"

@interface GPContentView()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation GPContentView

//当内容是从xib文件中,加载出来的时候,系统会主动调用awakeFromNib方法
//我们可以在该方法中,对xib文件上的对象进行一些属性设置
//awakeFromNib方法,相当于UIView的viewDidLoad方法
- (void)awakeFromNib
{
    self.tableView.rowHeight = 80;
//    self.tableView.delegate = self;
}

#pragma mark UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subjectArray.count;;
}
//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    //获得每一行对应的模型数据
    GPSubject * subject = self.subjectArray[indexPath.row];
    
    
    GPSubjectCell * cell = [GPSubjectCell subjectCellWithTableView:tableView];
    
    
    cell.subject = subject;
    
    
    return cell;
    
}

#pragma mark UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.delegate contentViewDidSelectedRow:self indexPath:indexPath model:self.subjectArray[indexPath.row]];
}

@end
