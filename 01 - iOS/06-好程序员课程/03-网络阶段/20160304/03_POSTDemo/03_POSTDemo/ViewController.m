//
//  ViewController.m
//  03_POSTDemo
//
//  Created by baoxu on 16/3/4.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

#define TEST_FORM_BOUNDARY @"ABCD1234"
#define BXEncode(str) [str dataUsingEncoding:NSUTF8StringEncoding]

@interface ViewController ()
{
    NSString *_userId;
    NSString *_url;
    NSMutableData *_data;
}
@property (weak, nonatomic) IBOutlet UITextField *userNameField;
@property (weak, nonatomic) IBOutlet UITextField *userPassField;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

}

#pragma mark -POST2上传图片-
-(void)sendPost2:(NSString *)urlStr parmater:(NSDictionary *)parm data:(NSData*)data name:(NSString *)fileName{

    //初始化要上传的数据
    NSMutableData *dataM = [NSMutableData data];

    //准备工作(规定好了的格式)，事先规定好分隔符TEST_FORM_BOUNDARY
    NSString *strTop=[NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"file\"; filename=\"%@\"\r\nContent-Type: %@\r\n",TEST_FORM_BOUNDARY,fileName,@"image/png"];
    NSLog(@"%@",strTop);
    
    [dataM appendData:BXEncode(strTop)];
    [dataM appendData:BXEncode(@"\r\n")];
    [dataM appendData:data];
    [dataM appendData:BXEncode(@"\r\n")];
    
    //遍历一遍字典参数，用block形式执行，会自动分配到多核cpu上运行
    [parm enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        //参数开始的标志
        NSString *boundry = [NSString stringWithFormat:@"--%@\r\n",TEST_FORM_BOUNDARY];
        [dataM appendData:BXEncode(boundry)];
        
        NSString *disposition = [NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n", key];
        
        [dataM appendData:BXEncode(disposition)];
        [dataM appendData:BXEncode(@"\r\n")];
        [dataM appendData:BXEncode(obj)];
        [dataM appendData:BXEncode(@"\r\n")];
    }];
    
    //尾部的分隔符
    NSString *strBottom = [NSString stringWithFormat:@"--%@--\r\n",TEST_FORM_BOUNDARY];
    
    [dataM appendData:BXEncode(strBottom)];
 
    //请求设置
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:dataM];
    
    
    //设置上传数据的长度及格式
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)dataM.length] forHTTPHeaderField:@"Content-Length"];
    
    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@",TEST_FORM_BOUNDARY] forHTTPHeaderField:@"Content-Type"];
    
    //上传
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *task = [session uploadTaskWithRequest:request fromData:dataM completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error && data) {
            NSLog(@"response:%@",response);
            NSLog(@"data:%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
        }else{
            NSLog(@"error:%@",error);
        }
        
    }];
    
    [task resume];


}

#pragma mark -POST1上传字符串-
-(void)sendPost1:(NSString *)urlStr parmater:(NSString *)parm{
    
    NSURL *url = [NSURL URLWithString:urlStr];
    //创建可变的请求
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:url];
    //设定请求方式
    [request setHTTPMethod:@"POST"];
    
    //要上传的数据转化成二进制data类型
    NSData *postData = [parm dataUsingEncoding:NSUTF8StringEncoding];
    
    //设置请求体
    [request setHTTPBody:postData];
    
    //设置请求长度
    [request setValue:[NSString stringWithFormat:@"%lu",(unsigned long)postData.length] forHTTPHeaderField:@"Content-Length"];
    
    //设置上传数据的格式
    [request addValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    
    //创建会话
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *task = [session uploadTaskWithRequest:request fromData:postData completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error && data) {
            NSLog(@"response:%@",response);
            NSLog(@"data:%@",[[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding]);
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:nil];
            if ([[dict objectForKey:@"status"] isEqualToString:@"100"]) {
                NSDictionary *userInfo = [dict objectForKey:@"userInfo"];
                _userId = [userInfo objectForKey:@"id"];
                
                NSString *headStr = [userInfo objectForKey:@"head_img"];
                headStr = [headStr substringFromIndex:1];
                headStr = [@"http://1000phone.net:8088/video_api" stringByAppendingString:headStr];
                NSLog(@"headStr:%@",headStr);
                [self showHeadImage:headStr];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self showMessage:_userId];
                });
            }
        }else{
            NSLog(@"error:%@",error);
        }
        
    }];
    
    [task resume];
}

-(void)showHeadImage:(NSString*)urlStr{
    NSURL *url = [NSURL URLWithString:urlStr];
    [NSURLConnection sendAsynchronousRequest:[NSURLRequest requestWithURL:url] queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse * _Nullable response, NSData * _Nullable data, NSError * _Nullable connectionError) {
        if (data && !connectionError) {
            self.iconImageView.image = [UIImage imageWithData:data];
        }
    }];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (IBAction)doLogin:(id)sender {
    
    NSString *username = self.userNameField.text;
    NSString *userpass = self.userPassField.text;
    NSString *urlStr = @"http://1000phone.net:8088/video_api/index.php/Home/User/authUser";
    if ([self isOK:username] && [self isOK:userpass]) {
        
        [self sendPost1:urlStr parmater:[NSString stringWithFormat:@"username=%@&userpass=%@",username,userpass]];
    }
}
- (IBAction)doRegister:(id)sender {
    
    NSString *username = self.userNameField.text;
    NSString *userpass = self.userPassField.text;
    NSString *urlStr = @"http://1000phone.net:8088/video_api/index.php/Home/User/registUser";
    if ([self isOK:username] && [self isOK:userpass]) {
        
        [self sendPost1:urlStr parmater:[NSString stringWithFormat:@"username=%@&userpass=%@",username,userpass]];
    }
}
//上传头像
- (IBAction)uploadIconImage:(id)sender {
    if (_userId == nil) {
        [self showMessage:@"请先登录"];
        return;
    }
    
//    _url = @"http://1000phone.net:8088/video_api/index.php/Home/User/ modifyHeadImg";
    _url = @"http://1000phone.net:8088/video_api/index.php/Home/User/modifyHeadImg";
    
    NSData *data = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"default" ofType:@"png"]];
    
    NSDictionary *param = @{@"id":_userId};
    
    [self sendPost2:_url parmater:param data:data name:@"head_image.png"];
    
}


#pragma mark -辅助功能-
//消息显示
-(void)showMessage:(NSString*)msg{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:msg delegate:nil cancelButtonTitle:@"好的" otherButtonTitles: nil];
    [alert show];
}

//判断字符串是否符合要求
-(BOOL)isOK:(NSString *)str{
    if ([str isEqualToString:@""] || str == nil) {
        [self showMessage:@"请输入内容"];
        return NO;
    }
    if (str.length<6 || str.length >12) {
        [self showMessage:@"长度需要在6~12位之间"];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
