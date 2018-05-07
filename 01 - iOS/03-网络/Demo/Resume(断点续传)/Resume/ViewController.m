//
//  ViewController.m
//  Resume
//
//  Created by MS on 15-8-16.
//  Copyright (c) 2015年 qf. All rights reserved.
//

//文件网址
#define k_urlStr @"http://media.animusic2.com.s3.amazonaws.com/Animusic-ResonantChamber480p.mov"

//文件保存路径
#define k_downloadPath [NSHomeDirectory() stringByAppendingPathComponent:@"tmp/231.mov"]

#import "ViewController.h"
#import "AFNetworking.h"

@interface ViewController ()

{
    //记录进度
    NSProgress *_progress;
    
    //下载任务
    NSURLSessionDownloadTask *_task;
    
    //用来记录已经下载的数据
    //如果暂停了，下次开始时直接把这个data传给服务器
    NSMutableData *_downloadData;
}

@property (weak, nonatomic) IBOutlet UIProgressView *pView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    _downloadData = [[NSMutableData alloc] init];
    
    //创建下载实用类
    AFURLSessionManager *sm = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:k_urlStr]];
    __autoreleasing NSProgress *progress = nil;
    
    //返回一个下载任务
    _task = [sm downloadTaskWithRequest:request progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        //设置下载的数据保存的路径
        return [NSURL fileURLWithPath:k_downloadPath];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (error) {
            NSLog(@"下载未完成");
        } else {
            //下载成功以后打印保存路径，可以去查看一下文件
            NSLog(@"下载成功==%@",k_downloadPath);
        }
    }];
    
    [_task resume];
    
    //防止释放，用成员指针记录
    _progress = progress;
    
    //观察进度
    [_progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:nil];
}

//暂停时保存data
- (IBAction)paushClick:(UIButton *)sender
{
    __weak NSMutableData *weakData = _downloadData;
    [_task cancelByProducingResumeData:^(NSData *resumeData) {
        weakData.data = resumeData;
    }];
}

//继续下载时使用暂停时保存的data
- (IBAction)continueClick:(UIButton *)sender
{
    if (!_downloadData.length) {
        return;
    }
    
    AFURLSessionManager *sm = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    __autoreleasing NSProgress *progress = nil;
    
    //使用之前保存的数据继续下载
    _task = [sm downloadTaskWithResumeData:_downloadData progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        return [NSURL fileURLWithPath:k_downloadPath];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        
        if (error) {
            NSLog(@"继续下载未完成");
        } else {
            //下载成功以后打印保存路径，可以去查看一下文件
            NSLog(@"继续下载成功==%@",k_downloadPath);
        }
        
    }];
    
    [_task resume];
    
    _progress = progress;
    
    //新的对象需要重新观察
    [_progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:nil];
}

#pragma mark - 下载进度改变

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //判断观察者事件是否是由进度改变触发的
    if (object == _progress && [keyPath isEqualToString:@"fractionCompleted"]) {
        
        NSLog(@"进度：%g", _progress.fractionCompleted);
        
        [self performSelectorOnMainThread:@selector(changeValueInMain:) withObject:@(_progress.fractionCompleted) waitUntilDone:YES];
    }
}

- (void)changeValueInMain:(NSNumber *)num
{
    _pView.progress = num.floatValue;
}

@end