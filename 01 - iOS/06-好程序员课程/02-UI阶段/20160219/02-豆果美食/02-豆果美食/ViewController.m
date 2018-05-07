//
//  ViewController.m
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"
#import "GPADS.h"
#import "GPSubject.h"
//#import "GPSubjectCell.h"
#import "GPContentView.h"

/*
 
 1.搭建无错运行的环境
 2.封装模型(相关数据,数据库,网络)
 3.视图的封装(cell的设计/xib,纯代码)
 
 */
@interface ViewController ()<GPContentViewDelegate>

@property (nonatomic ,copy)NSArray * adsArray;
@property (nonatomic ,copy)NSArray * subjectArray;
@property (nonatomic, copy)NSArray * plist;

@end

@implementation ViewController

- (NSArray *)plist
{
    if(_plist == nil)
    {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"quanquan.plist" ofType:@""];
        _plist = [NSArray arrayWithContentsOfFile:path];
        
    }
    return _plist;
}

- (NSArray *)adsArray
{
    if(_adsArray == nil)
    {
//        NSString * path = [[NSBundle mainBundle] pathForResource:@"quanquan.plist" ofType:@""];
//        NSArray * plist = [NSArray arrayWithContentsOfFile:path];
        
        NSArray * dictArray = self.plist[0];
        
        NSMutableArray * objs = [NSMutableArray array];
        
        for(NSDictionary * dict in dictArray)
        {
            GPADS * ads = [GPADS adsWithDict:dict];
            [objs addObject:ads];
        }
        _adsArray = objs;
        
    }
    return _adsArray;
}

- (NSArray *)subjectArray
{
    if(_subjectArray == nil)
    {
        NSArray * dictArray = self.plist[1];
        NSMutableArray * objs = [NSMutableArray array];
        for(NSDictionary * dict in dictArray)
        {
            GPSubject * subject = [GPSubject subjectWithDict:dict];
            [objs addObject:subject];
        }
        
        _subjectArray = objs;
    }
    return _subjectArray;
}
//MVC
//控制器,主要作用(封装模型,处理视图与模型之间的显示逻辑,以及处理用户的交互操作)

- (void)viewDidLoad {
    [super viewDidLoad];

    
    GPContentView * contentView = [[[NSBundle mainBundle] loadNibNamed:@"GPContentView" owner:nil options:nil] lastObject];
    [self.view addSubview:contentView];
    
    //将模型数据,传递给contentView
    contentView.subjectArray = self.subjectArray;
    contentView.delegate = self;
    
}

#pragma mark GPContentViewDelegate
- (void)contentViewDidSelectedRow:(GPContentView *)contentView indexPath:(NSIndexPath *)indexPath model:(id)model
{
    NSLog(@"点击了 %@",model);
}
- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
