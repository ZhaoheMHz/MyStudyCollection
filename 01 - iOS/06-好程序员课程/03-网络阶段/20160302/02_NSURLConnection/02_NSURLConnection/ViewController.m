//
//  ViewController.m
//  02_NSURLConnection
//
//  Created by baoxu on 16/3/2.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (copy, nonatomic) NSString *myUrlStr;

//接收数据用的data
@property (strong, nonatomic) NSMutableData *result;
//记录数据的总大小
@property (assign, nonatomic)float totalSize;

@end
/**
 *  Connection
    1.同步请求
    2.异步请求block方式
    3.异步请求代理方式
 */
@implementation ViewController

- (NSMutableData *)result
{
    if (!_result) {
        _result = [NSMutableData new];
    }
    return _result;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.progressView.hidden = YES;
    
//    _myUrlStr = @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=3";
    _myUrlStr = @"http://n.sinaimg.cn/hebei/transform/20160111/s8le-fxnkkuv4377641.jpg";
    _myUrlStr = @"http://imgsrc.baidu.com/forum/pic/item/749049ed2e738bd4e31996c9a18b87d6277ff936.jpg";
}


- (IBAction)btnClick:(id)sender {
    
//    [self syncDownloadWithConnection];
//    [self asyncDownloadWithConnectionBlock];
    [self asyncDownloadWithConnectionDelegate];
    
}
#pragma mark -代理方法-
//调用它就证明，链接有响应，已经下载完响应头，开始下载
-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    
//    NSLog(@"%s",__func__);
//    NSLog(@"%@",response);
    
    self.progressView.hidden = NO;
    //获取数据的总长度
    self.totalSize = response.expectedContentLength;
    
    self.result.length = 0;
}
//调用它就证明，正在接收数据，响应体，根据数据的大小，会不间断的接收，直至全部完成
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
//    NSLog(@"%s",__func__);
//    NSLog(@"%@",data);
    
    //不间断就收数据
    [self.result appendData:data];
    //获取进度比
    float pv = self.result.length/self.totalSize;
    //刷新进度(当前就是主线程，可以不去获取，如果不清楚，最好去获取主线程刷新UI)
    NSLog(@"%@",[NSThread currentThread]);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.progress = pv;
    });
}
//调用它就证明，已经下载完成
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
//    NSLog(@"%s",__func__);
//    NSLog(@"%@",connection);
    
    NSLog(@"%@",[NSThread currentThread]);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.imageView.image = [UIImage imageWithData:self.result];
        self.progressView.hidden = YES;
    });
}

//连接发生错误，下载失败
//1.断网了
//2.网址不对
-(void)connection:(NSURLConnection *)connection didFailWithError:(nonnull NSError *)error{
//    NSLog(@"%s",__func__);
//    NSLog(@"%@",error);
    
    NSLog(@"%@",[NSThread currentThread]);
    dispatch_async(dispatch_get_main_queue(), ^{
        self.progressView.hidden = YES;
    });
}


#pragma mark -异步，代理形式-
-(void)asyncDownloadWithConnectionDelegate{
    //1.将字符串地址转换成URL
    NSURL *url = [NSURL URLWithString:_myUrlStr];
    //2.将URL封装成NSURLRequest对象，可被Connection使用(忽略本地缓存)
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:20];
    
    //代理方法异步请求数据
    [NSURLConnection connectionWithRequest:request delegate:self];
    
}
#pragma mark -异步，blcok形式-
-(void)asyncDownloadWithConnectionBlock{

    //显示加载圈
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    //1.将字符串地址转换成URL
    NSURL *url = [NSURL URLWithString:_myUrlStr];
    //2.将URL封装成NSURLRequest对象，可被Connection使用
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    //相关参数
    NSOperationQueue *myQueue =[NSOperationQueue mainQueue];
    
    NSLog(@"%@",[NSThread currentThread]);
    NSLog(@"开始请求");
    //3.异步请求(block形式，iOS5.0后退出的方法)
    [NSURLConnection sendAsynchronousRequest:request queue:myQueue completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        
        NSLog(@"---block返回---");
        NSLog(@"%@",[NSThread currentThread]);
        //第一种判断方式
        if (!connectionError && data) {
            self.imageView.image = [UIImage imageWithData:data];
        }
        
        NSLog(@"response:%@",response);
        //第二种方式
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
        if(httpResponse.statusCode == 200){
            NSLog(@"返回成功");
        }
        
        //关闭加载圈
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        /**
         *  优点：方便使用，比如json的请求
            缺点：整体返回，不能分部接收，不能显示进度
         */

    }];
    NSLog(@"下载完成");
}

#pragma mark -同步-
-(void)syncDownloadWithConnection{
        //1.将字符串地址转换成URL
        NSURL *url = [NSURL URLWithString:_myUrlStr];
        //2.将URL封装成NSURLRequest对象，可被Connection使用
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        //给出所需参数
        NSURLResponse *response;
        NSError *error;
        //3.Connection建立网络连接
        NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
        if (error) {
            NSLog(@"%@",error);
            return;
        }
        //数据解析
        //    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
        
        //    NSLog(@"dict:%@",dict);
        
        self.imageView.image = [UIImage imageWithData:data];
        
        
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
