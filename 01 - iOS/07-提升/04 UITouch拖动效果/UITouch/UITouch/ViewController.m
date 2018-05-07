//
//  ViewController.m
//  UITouch
//
//  Created by 赵赤赤 on 15/11/6.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    UIView *_view1;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    _view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:_view1];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    _view1.center = point;
}

@end
