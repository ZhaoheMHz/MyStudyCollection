//
//  PSBRootViewController.m
//  day32-AFNetWorkingDemo
//
//  Created by 潘松彪 on 14-9-26.
//  Copyright (c) 2014年 PSB. All rights reserved.
//

#import "PSBRootViewController.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"

@interface PSBRootViewController ()

{
    //下载进度
    NSProgress * _progress;
    
    NSURLSessionDownloadTask * _task;
}

@end

@implementation PSBRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //1.检测网络状态
//    [self monitorNetworkType];
    //2.异步加载图片
//    [self asyncLoadImage];
    //GET
    //3.Json数据get请求
//    [self jsonGetRequest];
    //4.非JSon数据get请求
//    [self dataGetRequest];
    //POST
    //5.post请求
//    [self postRequest];
    //6.上传文件
//    [self uploadFile];
    //7.文件下载
    [self requestFile];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    
}


#pragma mark - 判断当前的网络状态
- (void)monitorNetworkType
{
    //AFNetWorking通过发送网络请求的方式判断当前网络状态，需要选择一个请求。推荐使用门户网站网址
    //请求队列的管理员
    AFHTTPRequestOperationManager  * manager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"www.baidu.com"]];
    
//    void (^block)(AFNetworkReachabilityStatus status);
//    block = ^(AFNetworkReachabilityStatus status){
//        
//    };
    //监控网络状态
    [manager.reachabilityManager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status){
    //这是一个代码块，是rootviewcontroller的代码块，但是由manager.reachabilityManager 调用
    //status是manager.reachabilityManager传过来的参数，也就是说，发送方通过这个参数，将网络状态发过来了。
        if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            NSLog(@"WiFi");
        } else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            NSLog(@"GPRS/3G/4G");
        } else if (status == AFNetworkReachabilityStatusNotReachable){
            NSLog(@"网络未连接");
        }
    }];
    //启动网络监控
    [manager.reachabilityManager startMonitoring];
    //当发生网络状态变化，回调block
}

#pragma mark - 异步加载图片
//异步下载图片，然后加载给imageView
- (void)asyncLoadImage
{
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    
    imageView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:imageView];
    
    [imageView setImageWithURL:[NSURL URLWithString:@"http://192.168.88.8/sns/my/headimage.php?uid=57"]];
}

#pragma mark - GET请求 JSON数据
- (void)jsonGetRequest
{
    //创建urlString
    NSString * urlString = @"http://192.168.88.8/sns/my/user_list.php";
    
    //数据请求的队列管理器，单例
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //解析json时出现问题，需要设置文件的内容
    //如此设置就会进行JSON解析
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    
    //发起get请求，第一个参数是请求的url字符串，第二个参数在get中传nil
    //后两个block，意思是成功调用block，失败调用block
    [manager GET:urlString parameters:nil success:
     ^(AFHTTPRequestOperation * operation, id responseObject){
         
         //JSON数据已经解析过了
         NSLog(@"%@", responseObject);
         //接下来要做的就是将数据从字典中取出放入数据源
         //在这里写填充数据源，可以调一个函数完成
     }
         failure:
    ^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    

}

#pragma mark - 非JSON数据请求
- (void)dataGetRequest
{
    NSString * urlString = @"http://192.168.88.8/sns/my/user_list.php";
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //设置请求的数据是data，不要解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    //如此设置后，请求到的数据就是data了，不会JSON解析。
    
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"%@", [responseObject class]);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"%@", error);
    }];
    
}

#pragma mark - POST请求
- (void)postRequest
{
    NSString * url = @"http://10.0.176.75/cgi-bin/post1.cgi";
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];
    
    //data Get请求如此设置
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //post键值对
    NSDictionary * dict = @{@"username":@"John", @"password":@"89091", @"message":@"hahahahaha"};
    
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSString * str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        //回馈数据
        NSLog(@"%@", str);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];

}

#pragma mark - 上传文件
- (void)uploadFile
{
    NSString * urlString = @"http://10.0.176.75/cgi-bin/post2.cgi";
    
    AFHTTPRequestOperationManager * manager = [AFHTTPRequestOperationManager manager];

    //设置返回数据的类型，其实也可以设JSON
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    
    [manager POST:urlString parameters:nil constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //这里设置上传的文件的data
        
        //找到上传的文件
        NSString * path = [[NSBundle mainBundle] pathForResource:@"123" ofType:@"png"];
        //将文件转成data传给formdata
        
        //name就是key
        [formData appendPartWithFileURL:[NSURL fileURLWithPath:path] name:@"image" fileName:@"123.png" mimeType:@"image/png" error:nil];
        //mimeType:@"image/png" @"text/html" @"text/json" @"text/xml" @"image/jpeg"等
        
        
        
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
       
        //responseObject是data
        NSString * str = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        
        NSLog(@"%@", str);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@", error);
    }];
    
}

#pragma mark - 文件下载
- (void)requestFile
{
    NSString * urlString = @"http://10.0.8.8/download/%E5%8D%83%E9%94%8B%E6%8A%80%E6%9C%AF%E4%BA%A4%E6%B5%81%E8%A7%86%E9%A2%91.mp4";
    //创建下载实用类
    AFURLSessionManager * manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    //参数是用来管理进度显示等kvo数据的
    
    //如果路径存在中文，需要转码
//    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    //第一个参数是请求，第二个参数是进度对象指针的地址，为了返回进度
    
    //__autoreleasing修饰传入地址的对象指针
    //相当于非arc中的autoreleas，延迟释放
    __autoreleasing NSProgress * progress = nil;
    //调用函数后，会自动创建一个progress对象，然后改变progress指针的值，让它指向这个对象
    
    //返回一个下载任务
    NSURLSessionDownloadTask * task = [manager downloadTaskWithRequest:request progress:&progress destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        //告诉下载管理器，文件存储的路径
        NSString * path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/视频.mp4"];
        return [NSURL fileURLWithPath:path];
        
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        //下载完成的回调，可能正确可能错误
        if (error) {
            NSLog(@"%@", error);
        }
    }];
    
    //启动下载任务
    [task resume];
    
    _task = task;
    
    NSLog(@"%@", NSHomeDirectory());
    
    //得到了progress对向
    _progress = progress;
    //用成员变量指向，如同做了一个强引用，保证刚刚创建的progress对象不会在当前函数结束时消失
 
    //设置观察者，观察进度  属性@"fractionCompleted"表示完成的进度
    [_progress addObserver:self forKeyPath:@"fractionCompleted" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == _progress && [keyPath isEqualToString:@"fractionCompleted"] == YES) {
        
//        NSLog(@"%f%%", [change[@"new"] doubleValue] * 100);
        NSLog(@"%.2f%%", _progress.fractionCompleted * 100);
        
    }
}



@end







