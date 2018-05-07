//
//  MyFavoriteViewController.m
//  MyFreeLimit
//
//  Created by mac on 14-4-11.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "MyFavoriteViewController.h"

#import "DataCenter.h"
#import "AppModel.h"
#import "IconView.h"
#import "DetailViewController.h"
#import "UIView+QFExt.h"

@interface MyFavoriteViewController ()

@end

@implementation MyFavoriteViewController

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
    
    self.navigationItem.title = @"我的关注";
    self.view.backgroundColor = [UIColor colorWithRed:226/255.0 green:226/255.0 blue:226/255.0 alpha:1];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
