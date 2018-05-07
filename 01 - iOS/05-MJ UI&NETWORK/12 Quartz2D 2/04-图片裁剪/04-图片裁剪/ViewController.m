//
//  ViewController.m
//  04-图片裁剪
//
//  Created by 赵赤赤 on 16/3/28.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.加载原图片
    UIImage *oldImage = [UIImage imageNamed:@"me"];
    
    // 2.开启上下文
    UIGraphicsBeginImageContextWithOptions(oldImage.size, NO, 0.0);
    
    // 3.取得当前的上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 4.画圆
    CGRect circleRect = CGRectMake(0, 0, oldImage.size.width, oldImage.size.height);
    CGContextAddEllipseInRect(ctx, circleRect);
    
    // 5.按圆形进行裁剪
    CGContextClip(ctx);
    
    // 6.画图
    [oldImage drawInRect:circleRect];
    
    // 7.取图
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 8.结束
    UIGraphicsEndImageContext();
    
    // 9.显示图片
    self.iconView.image = newImage;
}

@end
