//
//  TodayViewController.m
//  Extension
//
//  Created by baoxu on 16/1/22.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

#define INDEXHEADERAPI @"http://1000phone.net:8088/app/openfire/api/user/near.php?latitude=40.02212&longitude=116.4343&radius=100"

@interface TodayViewController () <NCWidgetProviding>
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;

@property (weak, nonatomic) IBOutlet UILabel *textLabel;
@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSURLSession * session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:[NSURL URLWithString:INDEXHEADERAPI] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data && !error) {
            NSDictionary *dict  = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            //            NSLog(@"dict:%@",dict);
            
            NSArray *arr = [dict objectForKey:@"users"];
            NSDictionary *dict2 = [arr objectAtIndex:2];
            NSString *createdDate = [dict2 objectForKey:@"createdDate"];
            NSString *headImageURL = [dict2 objectForKey:@"headImageURL"];
            
            NSLog(@"%@",[NSThread currentThread]);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                self.textLabel.text = createdDate;
                self.headImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:headImageURL]]];
            });
            
        }
        
    }];
    
    //任务执行
    [task resume];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)jumpToApp:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"todayDemo://123456"];
    //    [UIApplication shareApplication] openurl
    //在扩展中，这个方法被禁止使用，为了实现同样的功能，使用下面这个方法
    
    //extensionContext直接使用就行，不需要实例化，iOS8viewcontroller推出的新属性
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
        NSLog(@"openUrl");
    }];
    
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

@end
