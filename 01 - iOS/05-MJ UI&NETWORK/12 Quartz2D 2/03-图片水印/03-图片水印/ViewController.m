//
//  ViewController.m
//  03-图片水印
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
    
    UIImage *bgImage = [UIImage imageNamed:@"scene"];
    
    // 上下文：基于位图（bitmap），所有的东西都要画到一张新的图片上
    
    // 1.创建一个基于位图的上下文
    // Size：新图片的尺寸
    // opaque：Yes：不同名。No：透明
    UIGraphicsBeginImageContextWithOptions(bgImage.size, NO, 0.0);
    
    // 2.画背景
    [bgImage drawInRect:CGRectMake(0, 0, bgImage.size.width, bgImage.size.height)];
    
    // 3.画右下角的水印
    UIImage *waterImage = [UIImage imageNamed:@"logo"];
    CGFloat scale = 0.2;
    CGFloat margin = 5;
    CGFloat waterW = waterImage.size.width*scale;
    CGFloat waterH = waterImage.size.height*scale;
    CGFloat waterX = bgImage.size.width-waterW-margin;
    CGFloat waterY = bgImage.size.height-waterH-margin;
    
    [waterImage drawInRect:CGRectMake(waterX, waterY, waterW, waterH)];
    
    // 4.取得制作完成的图片
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 5.结束上下文
    UIGraphicsEndImageContext();
    
    // 6.显示到imageView上
    self.iconView.image = newImage;
}

@end
