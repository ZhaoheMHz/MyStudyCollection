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
#import "GPAdsView.h"
#import "GPFooterView.h"


@interface GPContentView()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, weak)GPAdsView * adsView;

@property (nonatomic, weak)GPFooterView * footerView;

@end

@implementation GPContentView

//懒加载footerView 保证不会重复性的创建该对象
- (GPFooterView *)footerView
{
    if(_footerView == nil)
    {
        GPFooterView * footerView = [GPFooterView footerView];
        [self.tableView addSubview:footerView];
        _footerView = footerView;
    }
    return _footerView;
}

//当内容是从xib文件中,加载出来的时候,系统会主动调用awakeFromNib方法
//我们可以在该方法中,对xib文件上的对象进行一些属性设置
//awakeFromNib方法,相当于UIView的viewDidLoad方法
- (void)awakeFromNib
{
    self.tableView.rowHeight = 80;
//    self.tableView.delegate = self;
    
    //添加headerView视图
    GPAdsView * adsView = [GPAdsView adsViewWithFrame:CGRectMake(0, 0, 375, 150)];
    adsView.backgroundColor = [UIColor yellowColor];
    self.tableView.tableHeaderView = adsView;
    self.adsView = adsView;
    
    //self.adsArray 值为nil所以不能正确的填充数据
//    adsView.adsArray = self.adsArray;
    
    /*
    GPFooterView * footerView = [GPFooterView footerView];
    footerView.frame = CGRectMake(0, 0, 375, 60);
    footerView.backgroundColor = [UIColor grayColor];

    self.tableView.tableFooterView = footerView;
     */
    
    /*
    GPFooterView * footerView = [GPFooterView footerView];
    footerView.frame = CGRectMake(0, self.tableView.contentSize.height, 375, 60);
    footerView.backgroundColor = [UIColor grayColor];
    
    [self.tableView addSubview:footerView];
     */
}

//确保在真正传递进来数据的时候,把真实的数据同步给adsView对象让他完成数据的显示
- (void)setAdsArray:(NSArray *)adsArray
{
    _adsArray = adsArray;
    self.adsView.adsArray = adsArray;
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

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
//    self.footerView;
    
    CGFloat maxY = scrollView.contentSize.height - scrollView.frame.size.height;
    CGFloat footViewH = 60;
    
    if(scrollView.contentOffset.y > maxY && scrollView.contentOffset.y <= maxY + footViewH)
    {
//        NSLog(@"拖拽读取更懂");
        [self.footerView setStatus:GPFooterViewStatusDragging];
    }
    else if (scrollView.contentOffset.y > maxY + footViewH)
    {
//        NSLog(@"松开读取更多读取更懂");
        [self.footerView setStatus:GPFooterViewStatusEndDragging];
    }
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //只有在松开读取更多的状态下,松开手才去加载更多
    if(self.footerView.status == GPFooterViewStatusEndDragging){
        //1.显示正在加载的状态
        [self.footerView setStatus:GPFooterViewStatusLoading];
        //2.不在弹回去
        scrollView.contentInset = UIEdgeInsetsMake(0, 0, 60, 0);
    }
}

@end
