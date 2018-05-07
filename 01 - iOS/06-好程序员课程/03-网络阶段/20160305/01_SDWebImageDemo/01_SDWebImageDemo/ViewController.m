//
//  ViewController.m
//  01_SDWebImageDemo
//
//  Created by baoxu on 16/3/5.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

//使用sd库需要导入的头文件
#import "SDImageCache.h"
#import "UIImageView+WebCache.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    NSString *urlStr = @"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg";//@"http://c.hiphotos.baidu.com/image/pic/item/023b5bb5c9ea15ce9c017233b1003af33a87b219.jpg";
    
    NSURL *url = [NSURL URLWithString:urlStr];
    [self setImageWithUrl:url];
}

#pragma mark -SDWebImage的使用方法-
-(void)setImageWithUrl:(NSURL *)url{
    /**
     *  1.下载图片,自带缓存，就这一句话，简单易用
     */
//    [self.imageView sd_setImageWithURL:url];
    
    /**
     *  2.用block回调，可以在图片加载完之后做某事
     */
//    [self.imageView sd_setImageWithURL:url completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"imageURL:%@",imageURL);
//        NSLog(@"cacheType:%ld",(long)cacheType);
//        NSLog(@"error:%@",error);
//    }];
    
    /**
     *  3.先给一个占位图片，加载完成后替换
     */
//    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default"]];
    
    /**
     *  4.先给一个占位图片，加载完替换，然后做block里面的事
     */
//    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//        NSLog(@"4.先给一个占位图片，加载完替换，然后做block里面的事");
//    }];
    
    /**
     *  5.选择下载方式，渐进式下载
     */
//    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"default"] options:SDWebImageProgressiveDownload];
    
    
    /**
     *  6.清除缓存(磁盘，内存等都能清除，有提示方法)
     */
    [[SDImageCache sharedImageCache] clearDisk];
}





/**
 *
 //失败后重试
 SDWebImageRetryFailed = 1 << 0,
 
 //UI交互期间开始下载，导致延迟下载比如UIScrollView减速。
 SDWebImageLowPriority = 1 << 1,
 
 //只进行内存缓存
 SDWebImageCacheMemoryOnly = 1 << 2,
 
 //这个标志可以渐进式下载,显示的图像是逐步在下载
 SDWebImageProgressiveDownload = 1 << 3,
 
 //刷新缓存
 SDWebImageRefreshCached = 1 << 4,
 
 //后台下载
 SDWebImageContinueInBackground = 1 << 5,
 
 //NSMutableURLRequest.HTTPShouldHandleCookies = YES;
 
 SDWebImageHandleCookies = 1 << 6,
 
 //允许使用无效的SSL证书
 //SDWebImageAllowInvalidSSLCertificates = 1 << 7,
 
 //优先下载
 SDWebImageHighPriority = 1 << 8,
 
 //延迟占位符
 SDWebImageDelayPlaceholder = 1 << 9,
 
 //改变动画形象
 SDWebImageTransformAnimatedImage = 1 << 10,
 */



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
