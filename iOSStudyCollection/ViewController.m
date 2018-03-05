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
    }
    
    
    
    
    if (indexPath.row == 0) {
        cell.textLabel.text = @"RAC通常用法";
    }
    
    else if (indexPath.row == 1) {
        cell.textLabel.text = @"链式计算器";
    }
    
    
    
    
    
    
    
    
    
    else {
        cell.textLabel.text = @"";
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        ZHRacNormalController *vc = [[ZHRacNormalController alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
    
    if (indexPath.row == 1) {
        ZHCaluVC *vc = [[ZHCaluVC alloc] init];
        [self presentViewController:vc animated:YES completion:nil];
    }
}

@end
