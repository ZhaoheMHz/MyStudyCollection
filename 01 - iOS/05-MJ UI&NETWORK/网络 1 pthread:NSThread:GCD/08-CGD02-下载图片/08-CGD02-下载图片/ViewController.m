//
//  ViewController.m
//  08-CGD02-下载图片
//
//  Created by 赵赤赤 on 15/9/18.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        // 下载图片
        NSData  *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://192.168.0.55/ClientSide/PrevPhonePic/ab55ffc1-13e0-4ef2-9718-568bb164b709"]];
        UIImage *image = [UIImage imageWithData:data];
        
        // 回到主线程显示图片
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
    });
}
@end
