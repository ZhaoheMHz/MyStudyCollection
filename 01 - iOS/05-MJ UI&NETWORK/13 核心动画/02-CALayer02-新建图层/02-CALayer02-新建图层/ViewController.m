//
//  ViewController.m
//  02-CALayer02-新建图层
//
//  Created by 赵赤赤 on 15/11/13.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 新建图层
    CALayer *layer = [[CALayer alloc] init];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(200, 100);
    
    layer.cornerRadius = 10;
    
    layer.masksToBounds = YES;
    
    // 为layer添加图片
    layer.contents = (id)[UIImage imageNamed:@"lufy"].CGImage;
    
    [self.view.layer addSublayer:layer];
}

@end
