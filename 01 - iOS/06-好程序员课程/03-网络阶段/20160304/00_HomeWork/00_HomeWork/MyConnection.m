//
//  MyConnection.m
//  00_HomeWork
//
//  Created by baoxu on 15/11/27.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "MyConnection.h"

@implementation MyConnection

-(id)initWithUrl:(NSString *)url Delegate:(id)delegate{
    self  = [super init];
    if (self) {
        self.delegate = delegate;
        self.url = url;
        //开始下载
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:30];
        NSURLConnection *con =  [NSURLConnection connectionWithRequest:request delegate:self];
        NSLog(@"con:%@",con);
    }
    return  self;
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    self.conData = [[NSMutableData alloc]init];
    self.conData.length = 0;
    self.totalSize = response.expectedContentLength;
    
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [self.conData appendData:data];
    [self.delegate downloadDidReceive:self Progress:[self.conData length]/self.totalSize];
    NSLog(@"进度：%f",[self.conData length]/self.totalSize);
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    [self.delegate downloadFinish:self Data:self.conData];

}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    [self.delegate downloadFail:self];
}


@end
