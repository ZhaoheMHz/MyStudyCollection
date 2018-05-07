//
//  GPTestViewController.m
//  01-事件传递
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTestViewController.h"
#import "GPGreenView.h"

@interface GPTestViewController ()

@end

@implementation GPTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
//    GPGreenView * grayView = [[GPGreenView alloc] init];
//    [self.view addSubview:grayView];
//    grayView.frame = CGRectMake(100, 400, 100, 200);
//    grayView.backgroundColor = [UIColor grayColor];
//    grayView.name = @"灰色";
    
    
    GPGreenView * greenView = [[GPGreenView alloc] init];
    [self.view addSubview:greenView];
    greenView.frame = CGRectMake(100, 200, 200, 200);
    greenView.backgroundColor = [UIColor greenColor];
    greenView.name = @"绿色";
    
    
//    GPGreenView * redView = [[GPGreenView alloc] init];
//    [greenView addSubview:redView];
//    redView.frame = CGRectMake(0, 0, 100, 400);
//    redView.backgroundColor = [UIColor redColor];
//    redView.name = @"红色";
    
    

    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
}


@end
