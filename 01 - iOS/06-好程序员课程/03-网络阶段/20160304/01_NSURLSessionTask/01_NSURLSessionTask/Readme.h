//
//  Readme.h
//  01_NSURLSessionTask
//
//  Created by baoxu on 16/3/4.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#ifndef Readme_h
#define Readme_h


#define  URL_JSON @"http://api.breadtrip.com/trips/hot/"
#define  URL_IMAGE @"http://farm3.staticflickr.com/2846/9823925914_78cd653ac9_b_d.jpg"
#define  URL_REGIST @"http://1000phone.net:8088/video_api/index.php/Home/User/registUser"
#define  URL_LOGIN @"http://1000phone.net:8088/video_api/index.php/Home/User/authUser"


#endif /* Readme_h */

/**
 回想一下：NSURLConnection，怎么使用？配合哪些类？都有哪些代理方法？
    NSURL（地址）
    NSURLRequest（请求）
    NSURLConnection（发送请求，建立连接，接收数据）
 ps：哪怕NSURLConnection没学好，NSURLSession必须学好
 
 NSURLSession？会话控制
 
 1.啥是session？为啥要推出他？
    a>.网络开发的一组API
    b>.丰富的代理方法，细度处理任务
    c>.支持身份认证
    d>.支持后台下载
 
 
 2.他是怎样工作的呢？
    组成网络会话的几大块
    a>.任务（NSURLSessionTask）
        NSURLSessionDataTask--数据交互
        NSURLSessionUploadTask--数据上传
        NSURLSessionDownloadTask--文件下载
    b>.session配置
        默认
        后台
        即瞬
 
 
 3.比NSURLConnection好在哪？
 
 
 */














