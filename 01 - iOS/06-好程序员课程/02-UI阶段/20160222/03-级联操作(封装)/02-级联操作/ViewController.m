//
//  ViewController.m
//  02-级联操作
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"
#import "GPCityView.h"
#import "GPAreaView.h"

@interface ViewController ()<GPCityViewDelegate>

@property (nonatomic, copy)NSArray * cityPlist;

@property (nonatomic, weak)GPAreaView * areaView;

@end

@implementation ViewController

- (NSArray *)cityPlist
{
    if(_cityPlist == nil)
    {
        NSString * path = [[NSBundle mainBundle] pathForResource:@"city.plist" ofType:nil];
        _cityPlist = [NSArray arrayWithContentsOfFile:path];
    }
    return _cityPlist;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    GPCityView * cityView = [GPCityView cityViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.5, self.view.frame.size.height)];
    [self.view addSubview:cityView];
    cityView.cityArray = self.cityPlist;
    cityView.mydelegate = self;
    
     
    GPAreaView * areaView = [GPAreaView areaViewWithFrame:CGRectMake(self.view.frame.size.width * 0.5, 0, self.view.frame.size.width * 0.5, self.view.frame.size.height)];
    [self.view addSubview:areaView];
    self.areaView = areaView;
 
  
    
}
- (void)cityViewDidSelectedRow:(GPCityView *)cityView indexPath:(NSIndexPath *)indexPath objects:(NSArray *)objects
{
    self.areaView.areaArray = objects;
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}

@end
