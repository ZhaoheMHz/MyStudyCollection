//
//  RootViewController.m
//  A1QQMenu
//
//  Created by 赵赤赤 on 15/9/24.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "RootViewController.h"
#import "HLScrollView.h"
#import "HLTableView.h"
#import "HomeViewController.h"
#import "DetailViewController.h"

@interface RootViewController () <UIScrollViewDelegate>
{
    HLScrollView *_bgScrollView;
    NSArray *_dataArr;
    HLTableView *_menuTableView;
    UINavigationController *_contentNavCon;
}

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 设置数据源数组
    _dataArr = [NSArray arrayWithObjects:@"aa", @"bb", @"cc", @"ddasdasdasdsadasda", @"ee", @"ff", @"gg", @"hh", @"ii", @"jj", @"kk", @"ll", nil];
    
    
    // 设置背景
    UIImageView *bgview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgview.image = [UIImage imageNamed:@"1.jpeg"];
    [self.view addSubview:bgview];
//    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"1"]];
    
    
    // 将一个ScrollView放到背景上
    _bgScrollView = [[HLScrollView alloc] initWithFrame:self.view.frame];
    _bgScrollView.delegate = self;
    [self.view addSubview:_bgScrollView];

    
    [self createMenu];
    [self createContent];
}

#pragma mark - 为ScrollView添加菜单和显示内容的View
- (void)createMenu {
    _menuTableView = [[HLTableView alloc] initWithFrame:CGRectMake(0, K_YPOINT, K_WIDTH * K_SCALE,K_SCALE * K_HEIGHT)];
    [_menuTableView configWithArray:_dataArr target:self selctor:@selector(clickWithIndexPath:)];
    [_bgScrollView addSubview:_menuTableView];
}

// 点击cell,push出新界面
- (void)clickWithIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *dvc = [[DetailViewController alloc] init];
    dvc.navigationItem.title = _dataArr[indexPath.row];
    [_contentNavCon pushViewController:dvc animated:YES];
    [_bgScrollView setContentOffset:CGPointMake(K_SCALE*K_WIDTH, 0) animated:YES];
}

- (void)createContent {
    // 将NavigationController的RootView作为ScrollView的右侧内容显示区使用
    _contentNavCon = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    CGRect frame = _contentNavCon.view.frame;
    frame.origin.x = K_SCALE * K_WIDTH;
    _contentNavCon.view.frame = frame;
    [_bgScrollView addSubview:_contentNavCon.view];
}

#pragma mark - ScrollView的滚动缩放效果
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    
    // x方向的偏移量
    CGFloat xMove = scrollView.contentOffset.x;
    // %g 打印CGFloat的时候,可以去掉小数点后面的0
//    NSLog(@"xmove = %g", xMove);
    

    
    /******************内容视图的缩放*******************************************/
    // 根据偏移量算出缩放倍数
    // xMove    300-----150------0
    // 缩放比例    1-----0.9------0
    CGFloat contScale = (1-K_SCALE)*(xMove/K_SCALE/K_WIDTH)+K_SCALE;
    //    NSLog(@"%g", scale);
    
    // 根据缩放倍数,缩放视图
    _contentNavCon.view.transform = CGAffineTransformMakeScale(contScale, contScale);
    
    // 修改x坐标
    CGRect contFrame = _contentNavCon.view.frame;
    contFrame.origin.x = K_WIDTH * K_SCALE;
    _contentNavCon.view.frame = contFrame;
    
    
    /******************tableView的缩放****************************************/
    CGFloat menuScale = 1 - contScale + K_SCALE;
    _menuTableView.transform = CGAffineTransformMakeScale(menuScale, menuScale);
    
    // NavView向左面移动多少,TableView就向右移动多少,保持TableView一直显示在窗口中
    CGRect menuFrame = _menuTableView.frame;
    menuFrame.origin.x = xMove;
    _menuTableView.frame = menuFrame;
}

@end
