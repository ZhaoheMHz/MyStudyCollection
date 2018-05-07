//
//  ViewController.m
//  01_NSURLSessionTask
//
//  Created by baoxu on 16/3/4.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "Readme.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)btnClick:(id)sender {
    
//    [self sessionDataTask:URL_JSON];
//    [self sessionUploadTask:URL_LOGIN];
    [self sessionDownloadTask:URL_IMAGE];
}

#pragma mark -三种任务-
//3.NSURLSessionDownloadTask
-(void)sessionDownloadTask:(NSString*)strUrl{
    //准备工作
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    //创建一个下载任务
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithRequest:request completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"%@",[NSThread currentThread]);
        NSLog(@"location:%@",location);
        
        //保存
//        NSString *documentPath = NSHomeDirectory();
        /**
         *  第二种获取沙盒目录的方法
         *
         *  @param directory#>   指定搜索路径 description#>
         *  @param domainMask#>  搜索范围 description#>
         *  @param expandTilde#> 是否展开路径 description#>
         *
         *  @return 沙盒路径
         */
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject];
        //包含Documents本身
        NSLog(@"documentPath:%@",documentPath);
        
        //将字符串路径转化成URL路径
        NSURL *documentUrl = [NSURL fileURLWithPath:documentPath];
        
        //将文件名拼接到Documents目录下，组成新路径
        NSURL *newUrl = [documentUrl URLByAppendingPathComponent:[location lastPathComponent]];
        //将文件转移
        [[NSFileManager defaultManager]moveItemAtURL:location toURL:newUrl error:nil];
        
        NSData *dataImage = [NSData dataWithContentsOfURL:newUrl];
        
        if (dataImage) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = [UIImage imageWithData:dataImage];
            });
        }
        
    }];
    
    [downloadTask resume];
}


//2.NSURLSessionUploadTask
-(void)sessionUploadTask:(NSString*)strUrl{
    //准备工作
    NSURL *url = [NSURL URLWithString:strUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //设置请求方法，需要大写
    request.HTTPMethod = @"POST";
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    //传给服务器的参数
    NSString *parm = [NSString stringWithFormat:@"username=%@&userpass=%@",@"xiaoming",@"woxiangjingjing"];
    
    NSData *parmData = [parm dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionUploadTask *uploadTask = [session uploadTaskWithRequest:request fromData:parmData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSLog(@"response:%@",response);
        NSLog(@"data:%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
    }];
    
    [uploadTask resume];
}


//1.NSURLSessionDataTask
-(void)sessionDataTask:(NSString*)strUrl{
    //准备工作
    NSURL *url = [NSURL URLWithString:strUrl];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //获取session（会话控制）
    //是默认的方法（默认缓存，默认cookie，默认鉴权。。。）
    NSURLSession *session = [NSURLSession sharedSession];
    
    //明确任务
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data && !error) {
            NSLog(@"%@",[NSThread currentThread]);
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            NSLog(@"dict:%@",dict);
        }
        
    }];
    
    //执行任务
    [dataTask resume];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
