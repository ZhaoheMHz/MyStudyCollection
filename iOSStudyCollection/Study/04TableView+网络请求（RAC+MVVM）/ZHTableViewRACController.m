//
//  ZHTableViewRACController.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/12.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHTableViewRACController.h"
#import "ZHRequestViewModel.h"

@interface ZHTableViewRACController ()

@property (nonatomic, strong) UITableView *tableView;

// viewModel
@property (nonatomic, strong) ZHRequestViewModel *requestViewModel;

@end

@implementation ZHTableViewRACController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    // 创建tableView
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self.requestViewModel;        // 让viewModel成为tableView的代理
    self.tableView.dataSource = self.requestViewModel;
    
    // 进行tableView数据的请求
    RACSignal *requestSignal = [self.requestViewModel.requestCommand execute:nil];
    [requestSignal subscribeNext:^(id  _Nullable x) {
        self.requestViewModel.models = x;
        // 刷新tableView
        [self.tableView reloadData];
    }];
}





#pragma mark - 懒加载
- (ZHRequestViewModel *)requestViewModel {
    if (_requestViewModel == nil) {
        _requestViewModel = [[ZHRequestViewModel alloc] init];
    }
    
    return _requestViewModel;
}

@end
