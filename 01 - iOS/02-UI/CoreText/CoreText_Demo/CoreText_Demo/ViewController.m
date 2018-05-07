//
//  ViewController.m
//  CoreText_Demo
//
//  Created by baoxu on 16/3/12.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "CoreTextView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CoreTextView *ctv = [[CoreTextView alloc]initWithFrame:CGRectMake(20, 50, 375-40, 667-100)];
    ctv.backgroundColor = [UIColor colorWithRed:0.8542 green:0.8542 blue:0.8542 alpha:1.0];
    [self.view addSubview:ctv];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
