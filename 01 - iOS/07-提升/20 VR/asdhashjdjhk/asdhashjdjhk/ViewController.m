//
//  ViewController.m
//  asdhashjdjhk
//
//  Created by 赵赤赤 on 16/8/24.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "VKPlayerController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//     Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    VKPlayerController *vc = [VKPlayerController playerControllerWithTitle:@"ahjsdjasd" contentUrl:[NSURL URLWithString:@"http://he.yinyuetai.com/A770015235B56F86CD3C57726A16BE2C.flv"] videoType:VKVideoTypeVR];
    [self vk_presentVKPlayerController:vc];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
