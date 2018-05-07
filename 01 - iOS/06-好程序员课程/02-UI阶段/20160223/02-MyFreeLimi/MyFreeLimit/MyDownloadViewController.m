//
//  MyDownloadViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-4-11.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "MyDownloadViewController.h"

#import "DataCenter.h"
#import "AppModel.h"
#import "IconView.h"
#import "DetailViewController.h"
#import "UIView+QFExt.h"

@interface MyDownloadViewController ()

@end

@implementation MyDownloadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.navigationItem.title = @"我的下载";
    self.view.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
    
    [self createUI];
    
}

-(void)createUI
{
    
    // 取得收藏的数组 数组里面存放的AppModel
    _appArray = [[DataCenter sharedInstance] getAllDownloadArray];
    float width = 70;
    float height = 80;
    for (int i = 0 ; i < _appArray.count; i++) {
        AppModel *am = [_appArray objectAtIndex:i];
        
        float x = (i%3) * (width + 20) + 30;
        float y = (i/3) *(height +20) + 30;
        CGRect rect = CGRectMake(x, y, width, height);
        IconView *iconView = [[IconView alloc] initWithFrame:rect];
        iconView.tag = i+1;
        // v.backgroundColor = [UIColor redColor];
        // 给IconView传入一个数据模型
        iconView.model = am;
        [iconView addTarget:self withAction:@selector(viewClick:)];
        
        [self.view addSubview:iconView];
    }
}
- (void) viewClick:(IconView *)v {
    //NSLog(@"click %@", v);
    
    int index = v.tag -1;
    DetailViewController *dvc = [[DetailViewController alloc] init];
    dvc.model = [_appArray objectAtIndex:index];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
