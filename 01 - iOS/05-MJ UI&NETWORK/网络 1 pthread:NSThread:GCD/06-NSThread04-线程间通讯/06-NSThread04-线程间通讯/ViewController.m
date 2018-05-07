//
//  ViewController.m
//  06-NSThread04-线程间通讯
//
//  Created by 赵赤赤 on 15/9/14.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self performSelectorInBackground:@selector(download) withObject:nil];
}

- (void)download
{
    // 1.下载图片
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=1177611089,3324747861&fm=80"]];
    UIImage *image = [UIImage imageWithData:data];
    
    // 2.回到主线程显示图片
//    [self performSelectorOnMainThread:@selector(settingImage:) withObject:image waitUntilDone:NO];
    
    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
}

//- (void)settingImage:(UIImage *)image
//{
//    self.imageView.image = image;
//}

@end
