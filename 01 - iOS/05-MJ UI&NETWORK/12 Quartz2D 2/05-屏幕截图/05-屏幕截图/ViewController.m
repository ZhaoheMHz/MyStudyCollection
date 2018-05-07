//
//  ViewController.m
//  05-屏幕截图
//
//  Created by 赵赤赤 on 16/3/28.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)clip:(id)sender {
    UIGraphicsBeginImageContextWithOptions(self.view.frame.size, NO, 0.0);
    
    // 将控制器的view的layer渲染的上下文
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    // 取出图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    // 写文件
    NSString *path = @"/Users/mhz/Desktop/new.png";
    NSData *data = UIImagePNGRepresentation(image);
    [data writeToFile:path atomically:YES];
}

@end
