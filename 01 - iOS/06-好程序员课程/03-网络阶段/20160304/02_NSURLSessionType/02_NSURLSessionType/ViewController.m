//
//  ViewController.m
//  02_NSURLSessionType
//
//  Created by baoxu on 16/3/4.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"

@interface ViewController ()<NSURLSessionDelegate,NSURLSessionDownloadDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
//默认配置的session
@property (strong, nonatomic) NSURLSession *defaultSession;
//后台session
@property (strong, nonatomic) NSURLSession *backgroundSession;
//即瞬session
@property (strong, nonatomic) NSURLSession *ephemeralSession;
//可取消的任务
@property (strong, nonatomic) NSURLSessionDownloadTask *canCancelTask;
//可断点的任务
@property (strong, nonatomic) NSURLSessionDownloadTask *canResumeTask;
//后台任务
@property (strong, nonatomic) NSURLSessionDownloadTask *backgroundTask;

//保存可恢复下载的数据
@property (strong, nonatomic) NSData *resumeData;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}


#pragma mark -三种session类型-

-(void)createDefaultSession{
    //使用默认配置创建
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    //创建默认模式的会话，并设置代理
    self.defaultSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    
    self.defaultSession.sessionDescription = @"defaultSession";
}


//可断点下载
- (IBAction)canResumeTask:(id)sender {
    
    if (!self.defaultSession) {
        [self createDefaultSession];
    }
    
    NSString *str = @"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    
    if (self.resumeData) {
        self.canResumeTask = [self.defaultSession downloadTaskWithResumeData:self.resumeData];
    }else{
        
        self.resumeData = [NSData data];
        self.canResumeTask = [self.defaultSession downloadTaskWithRequest:request];
    }
    
    [self.canResumeTask resume];
    
    
}
//中断下载
- (IBAction)stopTask:(id)sender {
    
    if (self.canResumeTask) {
        //中断这个任务
        //取消的时候，能够返回已经下载了的数据
        [self.canResumeTask cancelByProducingResumeData:^(NSData * _Nullable resumeData) {
            self.resumeData = resumeData;
            self.canResumeTask = nil;
        }];
    }
}
//可取消下载
- (IBAction)canCancelTask:(id)sender {
    if (!self.defaultSession) {
        [self createDefaultSession];
    }
    
    NSString *str = @"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    self.canCancelTask = [self.defaultSession downloadTaskWithRequest:request];
    
    [self.canCancelTask resume];
    
}
//取消
- (IBAction)cancel:(id)sender {
    
    if (self.canCancelTask) {
        [self.canCancelTask cancel];
        self.canCancelTask = nil;
    }
    NSLog(@"取消了任务");
}
//因为后台任务不能被释放掉，所以写成单例
-(NSURLSession *)backgroundSession{
    static NSURLSession *backgroundSession;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURLSessionConfiguration *config = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"backgroundSession"];
        
        backgroundSession = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
        
    });
    
    return backgroundSession;
}

//后台下载
- (IBAction)backgroundTask:(id)sender {
    
    NSString *str = @"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg";
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    
    self.backgroundTask = [self.backgroundSession downloadTaskWithRequest:request];
    
    [self.backgroundTask resume];
}


#pragma mark -下载代理方法-
//下载进度回调
-(void)URLSession:(NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(nonnull NSURL *)location{
    NSLog(@"location:%@",location);
    NSLog(@"currentThread:%@",[NSThread currentThread]);
    //刷新UI,需要先将临时文件保存起来再进行UI刷新
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:location]];
    });
}
//下载进度回调
-(void)URLSession:(NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite{
    //本次下载的大小
    NSLog(@"bytesWritten:%lld",bytesWritten);
    //已经下载了的大小
    NSLog(@"totalBytesWritten:%lld",totalBytesWritten);
    //总共需要下载的大小
    NSLog(@"totalBytesExpectedToWrite:%lld",totalBytesExpectedToWrite);
}
//恢复下载（断点）
-(void)URLSession:(NSURLSession *)session downloadTask:(nonnull NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes{
    
    NSLog(@"fileOffset:%lld",fileOffset);
    NSLog(@"expectedTotalBytes:%lld",expectedTotalBytes);
}

#pragma mark -会话的代理方法-
//会话完成，无论成功与否，这个方法都会被调用
-(void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error{
    NSLog(@"error:%@",error);
}


//后台下载完成，并且didFinishDownloadingToURL执行完后会后调用
-(void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session{
    
    AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    if (appDelegate.backgroundSessionCompletionHandel) {
        
        void (^completionHandel)() = appDelegate.backgroundSessionCompletionHandel;
        appDelegate.backgroundSessionCompletionHandel = nil;
        completionHandel();
        
    }
    NSLog(@"本次后台任务已经完成");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
