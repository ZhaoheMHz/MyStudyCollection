//
//  ViewController.m
//  01_HTTPAndSyncDownload
//
//  Created by baoxu on 16/3/2.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    //给一个要网络访问的地址
//    NSString *str = @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=3";
//    
//    NSString *str2 = @"http://n.sinaimg.cn/hebei/transform/20160111/s8le-fxnkkuv4377641.jpg";
//    
//    //将字符串封装成可用的URL
//    NSURL *url = [NSURL URLWithString:str];
//    NSURL *url2 = [NSURL URLWithString:str2];
//    
////    [self stringSyncDownloadWithUrl:url];
//    [self dataSyncDownloadWithUrl:url2];
}

#pragma mark -string方法同步请求-
-(void)dataSyncDownloadWithUrl:(NSURL *)url{
    //NSData的类方法同步获取网络上数据
    NSData *data = [NSData dataWithContentsOfURL:url];
    
//    NSData -->UIImage
    UIImage *image = [UIImage imageWithData:data];
//    UIImage -->NSData
    NSData *data2 = UIImagePNGRepresentation(image);
    NSData *data3 = UIImageJPEGRepresentation(image, 0.5);
    
    self.imageView.image = image;
    
    NSLog(@"下载完成");
}
#pragma mark -string方法同步请求-
-(void)stringSyncDownloadWithUrl:(NSURL *)url{
    
    NSError *error;
    
    //NSString的类方法同步请求网络字符串
    NSString *str = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    
    if (error) {
        NSLog(@"%@",error);
        return;
    }
    
//    NSString -->NSData
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
    
//    NSData -->NSString
    NSString *str2 = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
    
    NSLog(@"str:%@",dict);
}


- (IBAction)btnClick:(id)sender {
    //给一个要网络访问的地址
    NSString *str = @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=3";
    
    NSString *str2 = @"http://n.sinaimg.cn/hebei/transform/20160111/s8le-fxnkkuv4377641.jpg";
    
    //将字符串封装成可用的URL
    NSURL *url = [NSURL URLWithString:str];
    NSURL *url2 = [NSURL URLWithString:str2];
    
    //    [self stringSyncDownloadWithUrl:url];
    [self dataSyncDownloadWithUrl:url2];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
