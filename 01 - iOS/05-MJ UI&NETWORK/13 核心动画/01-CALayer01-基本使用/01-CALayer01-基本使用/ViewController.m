//
//  ViewController.m
//  01-CALayer01-基本使用
//
//  Created by 赵赤赤 on 15/11/13.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *pinkView;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testView];
    
    [self testImageView];
}

- (void)testImageView {
    // 3D形变效果
    self.iconView.layer.transform = CATransform3DMakeScale(1.5, 0.5, 0);
    self.iconView.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0 );
}

- (void)testView {
    // 边框效果
    self.pinkView.layer.borderWidth = 10;
    self.pinkView.layer.borderColor = [UIColor greenColor].CGColor;
    
    // 圆角
    self.pinkView.layer.cornerRadius = 10;
    
    // 阴影颜色
    self.pinkView.layer.shadowColor = [UIColor blackColor].CGColor;
    
    // 阴影的偏差
    self.pinkView.layer.shadowOffset = CGSizeMake(10, 10);
    
    // 阴影的透明度
    self.pinkView.layer.shadowOpacity = 0.5;
}

@end
