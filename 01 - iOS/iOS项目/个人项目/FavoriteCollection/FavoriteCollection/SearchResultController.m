//
//  SearchResultController.m
//  FavoriteCollection
//
//  Created by 赵赤赤 on 15/9/26.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "SearchResultController.h"
#import "Model.h"
#import "AddItemController.h"
#import "ModelCell.h"

@interface SearchResultController () <UITableViewDataSource, UITableViewDelegate>


@end

@implementation SearchResultController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    
    CGRect frame = self.view.frame;
    frame.origin.y = 64;
    frame.size.height -= 64+49;
    _tableView = [[UITableView alloc] initWithFrame:frame];
    _tableView.tableFooterView = [[UIView alloc] init];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    [_tableView registerNib:[UINib nibWithNibName:@"ModelCell" bundle:nil] forCellReuseIdentifier:@"search"];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.resultArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ModelCell *cell = [tableView dequeueReusableCellWithIdentifier:@"search" forIndexPath:indexPath];
    
    Model *model = self.resultArr[indexPath.row];
    [cell loadModel:model];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 取消选中效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AddItemController *addController = [[AddItemController alloc] init];
    addController.model = _resultArr[indexPath.row];
    addController.isSearch = YES;
    
    [self presentViewController:addController animated:YES completion:nil];
}

@end
