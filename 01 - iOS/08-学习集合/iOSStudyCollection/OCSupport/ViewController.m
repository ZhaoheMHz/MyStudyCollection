//
//  ViewController.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/5.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ViewController.h"
#import "ZHRacNormalController.h"
#import "ZHCaluVC.h"
#import "ZHLoginViewController.h"
#import "ZHTableViewRACController.h"
#import "GCDNSOperationController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1000;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    
    
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"01 链式函数协议思想";
    }
    
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"02 RAC通常用法";
    }
    
    else if (indexPath.row == 2) {
        cell.textLabel.text = @"03 RAC登录Demo";
    }
    
    else if (indexPath.row == 3) {
        cell.textLabel.text = @"04 TableView+网络请求（RAC+MVVM）";
    }
    
    else if (indexPath.row == 4) {
        cell.textLabel.text = @"05 ReactiveSwift";
    }
    
    else if (indexPath.row == 5) {
        cell.textLabel.text = @"06 Swift基础";
    }
    
    else if (indexPath.row == 6) {
        cell.textLabel.text = @"07 RxSwift";
    }
    
    else if (indexPath.row == 7) {
        cell.textLabel.text = @"08 GCD & NSOperation";
    }
    
    else if (indexPath.row == 8) {
        cell.textLabel.text = @"09 算法";
    }
    
    
    
    
    
    
    
    
    else {
        cell.textLabel.text = @"";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ZHCaluVC *vc = [[ZHCaluVC alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row == 1) {
        ZHRacNormalController *vc = [[ZHRacNormalController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row == 2) {
        ZHLoginViewController *vc = [[ZHLoginViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row == 3) {
        ZHTableViewRACController *vc = [[ZHTableViewRACController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row == 4) {
        ZHReactiveSwiftDemoController *vc = [[ZHReactiveSwiftDemoController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row == 5) {
        SwiftNormalIndexClass *vc = [[SwiftNormalIndexClass alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row == 6) {
        ZHRxSwiftViewController *vc = [[ZHRxSwiftViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row == 7) {
        GCDNSOperationController *vc = [[GCDNSOperationController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row == 8) {
        ZHAlgorithmViewController *vc = [[ZHAlgorithmViewController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end
