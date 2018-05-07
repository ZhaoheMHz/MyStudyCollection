//
//  ViewController.m
//  02_ AFNetWorkingDemo
//
//  Created by baoxu on 16/3/5.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

#import "AFNetworking.h"
#import "UIImage+AFNetworking.h"
#import "UIKit+AFNetworking.h"

@interface ViewController ()
{
    //下载任务
    NSURLSessionDownloadTask *_task;
    //下载进度
    NSProgress *_progress;
}
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.progressView.hidden = YES;
}

- (IBAction)downloadBegin:(id)sender {

    NSString *str = @"http://g.hiphotos.baidu.com/baike/c0%3Dbaike92%2C5%2C5%2C92%2C30/sign=c70f4c2680025aafc73f76999a84c001/359b033b5bb5c9ea03d20905d739b6003af3b336.jpg";
    NSURL *url = [NSURL URLWithString:str];
    NSString *jsonStr = @"http://api.breadtrip.com/trips/hot/";
    NSString *post1Str = @"http://1000phone.net:8088/video_api/index.php/Home/User/authUser";
    NSString *post2Str = @"http://1000phone.net:8088/video_api/index.php/Home/User/modifyHeadImg";
    
    NSString *fileUrl = @"http://baoxu.local/share/Hao_11/day4/Resources.zip";
//    好11
    //1.网络监听
//    [self motionNetworkType];
    
    //2.异步下载图片
//    [self asyncDownloadImage:url];
    
    //GET
    //3.Json解析
//    [self jsonGetRequest:jsonStr];
    //4.非Json请求
//    [self dataGetRequest:str];
    
    //POST
    //5.post1请求
//    [self post1Request:post1Str];
    //6.post2上传文件
//    [self post2Request:post2Str];
    
    
    //7.文件下载
    [self downloadFile:fileUrl];
}

/**
 *  7.文件下载
 */
-(void)downloadFile:(NSString *)url{
    //创建AF的下载类
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    
    //如果路径中存在中文，需要转码
//    NSString *chineseUrl = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *newUrl = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:newUrl];
    NSLog(@"%@",NSHomeDirectory());
    
    __autoreleasing NSProgress *progress;
    
    _task = [manager downloadTaskWithRequest:request progress:&progress destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        //下载的临时路径
        NSLog(@"targetPath:%@",targetPath);
        NSLog(@"response:%@",response);
        
        //告诉下载管理者，文件的存储路径，会自动移动到对应位置
        NSString *path = [NSHomeDirectory()  stringByAppendingString:@"/Documents/download.zip"];
        return [NSURL fileURLWithPath:path];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        
    }];
    
    [_task resume];
    //得到参数的progress对象，用成员变量保证这个进度不会丢失
    _progress = progress;
    
    //设置progress的观察者，用来监听下载进度
    [progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:nil];
}
//响应监听方法
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    if (object == _progress && [keyPath isEqualToString:@"fractionCompleted"]) {
        NSLog(@"%2f",_progress.fractionCompleted);
        dispatch_async(dispatch_get_main_queue(), ^{
            self.progressView.hidden = NO;
            self.progressView.progress = _progress.fractionCompleted;
            if (1-self.progressView.progress <= 0.01) {
                self.progressView.hidden = YES;
            }
            
        });
    }
}


/**
 *  6.POST2类型的请求
 */
-(void)post2Request:(NSString *)url{
    //获取请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //这样设置，请求data不用解析,上传图片，需要这样设置
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //post键值对参数
    NSDictionary *dict = @{@"id":@"436"};
    
    [manager POST:url parameters:dict constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        
        NSString *path = [[NSBundle mainBundle] pathForResource:@"head" ofType:@"jpg"];
        
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:path] name:@"head_image" fileName:@"head.jpg" mimeType:@"image/jpg" error:nil];
        /**
         *mimeType:值一般这么给
         @"image/png"
         @"image/jpg"
         @"text/html"
         @"application/json"
         @"text/json"
         @"video/MP4"
         ...
         */
        
    } success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"responseObject:%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
    
}


/**
 *  5.POST1类型的请求
 */
-(void)post1Request:(NSString *)url{
    //获取请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //这样设置，请求data不用解析
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",nil];
    
    //参数，字典类型，键值对，登录
    NSDictionary *dict = @{
                           @"username":@"laoluobo",
                           @"userpass":@"123456"
                           };
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"responseObject:%@",responseObject);
//        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
//        NSLog(@"dict%@",dict);
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
    
}

/**
 *  4.请求 非 Json类型数据
 */
-(void)dataGetRequest:(NSString *)url{
    //获取请求管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    //这样设置，请求data不用解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"responseObject:%@",[responseObject class]);
        self.imageView.image = [UIImage imageWithData:responseObject];
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        
    }];
    
}

/**
 *  3.请求Json类型数据
 */
-(void)jsonGetRequest:(NSString *)url{
    //获取强求队列管理者
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //这样设置，就会自动解析json
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",nil];
    
    //发送请求（GET）
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        
        NSLog(@"operation:%@",operation);
        NSLog(@"responseObject:%@",responseObject);
        
    } failure:^(AFHTTPRequestOperation * _Nonnull operation, NSError * _Nonnull error) {
        NSLog(@"error:%@",error);
    }];
    
}

/**
 *  2.异步下载图片
 */
-(void)asyncDownloadImage:(NSURL *)url{
    //就这一句
    [self.imageView setImageWithURL:url];
}

/**
 *  1.监听网络状态
 */
-(void)motionNetworkType{
    //请求队列的管理者
    AFHTTPRequestOperationManager *manger = [[AFHTTPRequestOperationManager alloc]initWithBaseURL:[NSURL URLWithString:@"www.baidu.com"]];
    
    //注册网络变化的回调方法
    [manger.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            NSLog(@"WiFi");
        }else if(status == AFNetworkReachabilityStatusReachableViaWWAN){
            NSLog(@"3G/4G/GPRS流量");
        }else if(status == AFNetworkReachabilityStatusNotReachable){
            NSLog(@"未连接网络");
        }
    }];
    
    //启动网络监听模式，如果网络有变化，调用上面的block
    [manger.reachabilityManager startMonitoring];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
