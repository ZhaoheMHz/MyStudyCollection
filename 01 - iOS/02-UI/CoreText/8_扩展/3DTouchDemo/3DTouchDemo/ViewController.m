//
//  ViewController.m
//  3DTouchDemo
//
//  Created by baoxu on 16/1/21.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "ScanningViewController.h"
#import "SearchViewController.h"
#import "AddViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource, UIViewControllerPreviewingDelegate>
{
    UITableView *_tableView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    // 判断手机是否支持 3D Touch ， 支持的话就注册PreviewingDelegate
    // 实现UIViewControllerPreviewingDelegate方法
    if (self.traitCollection.forceTouchCapability == UIForceTouchCapabilityAvailable) {
        [self registerForPreviewingWithDelegate:self sourceView:_tableView];
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    int kSwitch = (int)indexPath.row;
    switch (kSwitch) {
        case 0:
            [self.navigationController pushViewController:[[ScanningViewController alloc] init] animated:YES];
            break;
        case 1:
            [self.navigationController pushViewController:[[SearchViewController alloc] init] animated:YES];            break;
        case 2:
            [self.navigationController pushViewController:[[AddViewController alloc] init] animated:YES];            break;
        default:
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    int kSwitch = (int)indexPath.row;
    switch (kSwitch) {
        case 0:
            cell.textLabel.text = @"扫一扫";
            break;
        case 1:
            cell.textLabel.text = @"搜索";
            break;
        case 2:
            cell.textLabel.text = @"添加";
            break;
        default:
            break;
    }
    
    return cell;
}


//发生 3D touch 的时候调用此方法
// 此时需要丢出预览视图
- (UIViewController *)previewingContext:(id<UIViewControllerPreviewing>)previewingContext viewControllerForLocation:(CGPoint)location
{
    UIViewController *vc = nil;
    int indexPath = (int)[_tableView indexPathForRowAtPoint:location].row;
    
    switch (indexPath) {
        case 1:
            vc = [[SearchViewController alloc]init];
            break;
        case 2:
            vc = [[AddViewController alloc]init];
            break;
        default:
            break;
    }
    
    //设置预览视图的size ， 0表示用默认的
    vc.preferredContentSize = CGSizeMake(0, 400);
    
    return vc;
}


// 在预览视图存在的情况下 继续按压屏幕 调用此方法
// 此时直接显示出 详情视图

- (void)previewingContext:(id<UIViewControllerPreviewing>)previewingContext commitViewController:(UIViewController *)viewControllerToCommit
{
    [self showViewController:viewControllerToCommit sender:self];
}

@end
