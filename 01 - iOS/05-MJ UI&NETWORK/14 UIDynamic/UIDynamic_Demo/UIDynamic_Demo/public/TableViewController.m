//
//  TableViewController.m
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "TableViewController.h"
#import "DynamicViewController.h"

@interface TableViewController ()
{
    //记录所有要演示的物理效果
    NSArray *_functions;
}
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _functions = @[
                   @"重力加速",
                   @"吸附行为",
                   @"推动行为",
                   @"刚性附加行为",
                   @"弹性附加行为",
                   @"碰撞检测"
                   ];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _functions.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.textLabel.text = _functions[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DynamicViewController *dynamicVC = [[DynamicViewController alloc]init];
    
    dynamicVC.title = _functions[indexPath.row];
    
    dynamicVC.type = (int)indexPath.row;
    
    [self.navigationController pushViewController:dynamicVC animated:YES];
    
}



@end
