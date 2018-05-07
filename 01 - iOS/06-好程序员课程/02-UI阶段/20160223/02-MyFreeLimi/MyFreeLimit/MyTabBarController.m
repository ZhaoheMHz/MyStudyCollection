//
//  QFTabBarController.m
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "MyTabBarController.h"

@interface MyTabBarController ()
{
    NSMutableArray *_viewControllerArray;
}
@end

@implementation MyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _viewControllerArray = [[NSMutableArray alloc] init];
    }
    return self;
}

-(UIViewController *)addViewControllerWithName:(NSString *)name title:(NSString *)title imageFile:(NSString *)imageFile
{
    //创建视图控制器
    Class cls = NSClassFromString(name);
    UIViewController *vc = [[cls alloc] init];
    vc.title = title;
    
    //创建导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageFile];
    
    [_viewControllerArray addObject:nav];
    
    self.viewControllers = _viewControllerArray;
    return vc;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
