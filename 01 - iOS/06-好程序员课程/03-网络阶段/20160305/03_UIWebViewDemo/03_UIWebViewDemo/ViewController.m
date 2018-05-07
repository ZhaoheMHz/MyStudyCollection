//
//  ViewController.m
//  03_UIWebViewDemo
//
//  Created by baoxu on 16/3/5.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

#define MAIN_SIZE [UIScreen mainScreen].bounds.size
#define BAR_HIGHT 44+20

#define DEBUGLOG(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__)


@interface ViewController ()<UIWebViewDelegate>
{
    //展示网页
    UIWebView *_webView;
    //工具条
    UIImageView *_viewBar;
    //菊花
    UIActivityIndicatorView *_activityView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSString *str = @"http://www.baidu.com";
    NSURL *url = [NSURL URLWithString:str];
    
    //直接使用Safari浏览器打开
    //    [[UIApplication sharedApplication] openURL:url];
    //使用内置浏览器打开
    
    [self showUIWebView:url];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

}

-(void)showUIWebView:(NSURL*)url{

    [self createViewBar];
    [self showLoading];
    
    _webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, BAR_HIGHT, MAIN_SIZE.width, MAIN_SIZE.height-BAR_HIGHT)];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    _webView.delegate = self;
    _webView.scrollView.bounces = YES;
    _webView.scalesPageToFit = YES;
    _webView.userInteractionEnabled = YES;
    
    [self.view addSubview:_webView];
}

#pragma mark -代理方法-

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    DEBUGLOG(@"开始加载");
    [_activityView startAnimating];
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    DEBUGLOG(@"加载完成");
    [_activityView stopAnimating];
    
    //1.获取当前页面的URL
    NSString *url = [webView stringByEvaluatingJavaScriptFromString:@"document.location.href"];
    DEBUGLOG(@"url:%@",url);
    
    //2.获取当前页面的标题
    NSString *title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    DEBUGLOG(@"title:%@",title);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(nullable NSError *)error{
    DEBUGLOG(@"error:%@",error);
}


#pragma mark -页面搭建-
-(void)createViewBar{
    //背景
    _viewBar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, MAIN_SIZE.width, BAR_HIGHT)];
    
    _viewBar.image = [UIImage imageNamed:@"bar_bg"];
    _viewBar.userInteractionEnabled = YES;
    
    //建立数组模型
    NSArray *imageNames = @[@"back_n",
                            @"left_n",
                            @"right_n",
                            @"refresh_n"];
    NSArray *highImageNames = @[@"back_h",
                            @"left_h",
                            @"right_h",
                            @"refresh_h"];
    NSArray *titles = @[@"退出",
                        @"后退",
                        @"恢复",
                        @"刷新"];
    //创建button
    for (int i=0; i<4; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        CGFloat itemLength = MAIN_SIZE.width/4.0;
        btn.frame = CGRectMake(itemLength*i, 0, itemLength, BAR_HIGHT);
        //title
        [btn setTitle:titles[i] forState:UIControlStateNormal];
        //正常状态的图片
        NSString *nameStr = [NSString stringWithFormat:@"%@.png",imageNames[i]];
        [btn setImage:[UIImage imageNamed:nameStr] forState:UIControlStateNormal];
        //高亮状态的图片
        NSString *highNameStr = [NSString stringWithFormat:@"%@.png",highImageNames[i]];
        [btn setImage:[UIImage imageNamed:highNameStr] forState:UIControlStateSelected];
        
        btn.titleLabel.font = [UIFont systemFontOfSize:13];
        //让文字偏移（上，左，下，右）
        btn.titleEdgeInsets = UIEdgeInsetsMake(40, -60, 0, 0);
        btn.imageEdgeInsets = UIEdgeInsetsMake(-10, 0, 0, 0);
        
        btn.tag = 100+i;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [_viewBar addSubview:btn];
    }
    [self.view addSubview:_viewBar];
}
-(void)btnClick:(UIButton*)btn{

    switch (btn.tag) {
        case 100:
            [_webView stopLoading];
            break;
        case 101:
            [_webView goBack];
            break;
        case 102:
            [_webView goForward];
            break;
        case 103:
            [_webView reload];
            break;
        default:
            break;
    }
}

-(void)showLoading{
    _activityView = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [_activityView setCenter:self.view.center];
    
    [_activityView setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    _activityView.hidesWhenStopped = YES;
    [_activityView startAnimating];
    [self.view addSubview:_activityView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
