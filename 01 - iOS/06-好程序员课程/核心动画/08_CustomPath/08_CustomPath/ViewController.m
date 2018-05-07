//
//  ViewController.m
//  08_CustomPath
//
//  Created by baoxu on 16/3/8.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "CustomPathView.h"

@interface ViewController ()

@property(nonatomic, weak)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //创建自定义View对象
    CustomPathView *pathView = [[CustomPathView alloc] init];
    //设置frame
    pathView.frame = self.view.frame;
    [self.view addSubview:pathView];
    pathView.backgroundColor = [UIColor whiteColor];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 150, 64, 64)];
    [pathView addSubview:imageView];
    imageView.image = [UIImage imageNamed:@"Ball"];
    self.imageView = imageView;
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
