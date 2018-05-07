//
//  ViewController.m
//  09-GCD03-其他用法
//
//  Created by 赵赤赤 on 15/9/18.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"


#define global_queue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self delay];
    
    // 图片1: https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1025156820,902028800&fm=80;
    // 图片2: https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=813012418,1640462637&fm=80;
    // 下载两张图片,将两张图片合并成一张照片后,显示到imageView上
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    dispatch_async(global_queue, ^{
//        // 下载图片1
//        UIImage *image1 = [self imageWithURL:@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1025156820,902028800&fm=80"];
//        
//        UIImage *image2 = [self imageWithURL:@"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=813012418,1640462637&fm=80"];
//        
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.imageView1.image = image1;
//            self.imageView2.image = image2;
//            
//            // 合并图片
//            UIGraphicsBeginImageContextWithOptions(CGSizeMake(322, 127), NO, 0.0);
//            [image1 drawAsPatternInRect:CGRectMake(0, 0, 161, 127)];
//            [image2 drawAsPatternInRect:CGRectMake(161, 0, 161, 127)];
//            
//            self.bigImageView.image = UIGraphicsGetImageFromCurrentImageContext();
//            
//            // 关闭上下文
//            UIGraphicsEndImageContext();
//        });
//    });

#pragma mark - 组队列的使用
    // 创建一个组
    dispatch_group_t group = dispatch_group_create();
    
    // 开启一个任务下载图片1
    __block UIImage *image1 = nil;
    dispatch_group_async(group, global_queue, ^{
        image1 = [self imageWithURL:@"https://ss0.baidu.com/6ONWsjip0QIZ8tyhnq/it/u=1025156820,902028800&fm=80"];
    });
    
    // 开启一个任务下载图片2
    __block UIImage *image2 = nil;
    dispatch_group_async(group, global_queue, ^{
        image2 = [self imageWithURL:@"https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=813012418,1640462637&fm=80"];
    });
    
    // 等group中所有任务执行完毕再执行合并的操作
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        self.imageView1.image = image1;
        self.imageView2.image = image2;
        
        // 合并图片
        UIGraphicsBeginImageContextWithOptions(CGSizeMake(322, 127), NO, 0.0);
        [image1 drawAsPatternInRect:CGRectMake(0, 0, 161, 127)];
        [image2 drawAsPatternInRect:CGRectMake(161, 0, 161, 127)];
        
        self.bigImageView.image = UIGraphicsGetImageFromCurrentImageContext();
        
        // 关闭上下文
        UIGraphicsEndImageContext();
    });
    
    
    
    
    
    // dispatch_once,整个应用中只会执行一次
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSLog(@"touchBegan");
//    });
}

- (UIImage *)imageWithURL:(NSString *)urlStr
{
    NSData  *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlStr]];
    UIImage *image = [UIImage imageWithData:data];
    return image;
}

- (void)delay
{
    NSLog(@"====touchBegan===%@", [NSThread currentThread]);
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        [self performSelector:@selector(run) withObject:nil afterDelay:2.0];
//    });
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"=====run====%@", [NSThread currentThread]);
    });
}

@end
