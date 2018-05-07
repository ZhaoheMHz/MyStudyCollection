//
//  ViewController.m
//  02_JSONModelDemo
//
//  Created by baoxu on 15/9/2.
//  Copyright (c) 2015年 BaoXu. All rights reserved.
//

#import "ViewController.h"
#import "ItemModel.h"

@interface ViewController ()

@end
/**
 *   @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=3";
 */


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *urlStr = @"http://iappfree.candou.com:8080/free/applications/limited?currency=rmb&page=3";
    NSURL *url = [NSURL URLWithString:urlStr];
    
    [self downloadTask:url];
}

-(void)downloadTask:(NSURL *)url{

    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        //取到最外层的字典
        NSDictionary *dictJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        //取出字典里面的applications数组
        NSArray *applications = [dictJson objectForKey:@"applications"];
        for ( NSDictionary *dict in applications ) {
            ItemModel *item = [[ItemModel alloc]initWithDictionary:dict error:nil];
//            item.applicationId = @"";
//            item.name = @"";
        
            
            NSLog(@"item:%@\n\n",item);
            NSLog(@"itemtoJSON:%@\n\n\n",item.toJSONString);
        }
        
    }];
    
    [dataTask resume];
    
    NSString *json = @"{\"applicationId\": \"757752585\",\"slug\": \"puzzle-chef\",\"name\": \"美味厨房\",\"releaseDate\": \"2014-09-17\",\"version\": \"1.3.0\"}";
    
    //能够自动检测 key 的正确性
    ItemModel *model = [[ItemModel alloc]initWithString:json usingEncoding:NSUTF8StringEncoding error:nil];
    NSLog(@"------model-------:%@",model);
    NSLog(@"------modelToDict-------:%@",model.toDictionary);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
