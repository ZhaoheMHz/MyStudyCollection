//
//  ViewController.m
//  08-核心动画04-CATransition
//
//  Created by 赵赤赤 on 16/4/2.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (nonatomic, assign) int index;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)up:(id)sender {
    self.index--;
    
    if (self.index == -1) {
        self.index = 8;
    }
    
    NSString *filename = [NSString stringWithFormat:@"%d.jpg", self.index+1];
    self.iconView.image = [UIImage imageNamed:filename];
    
    
    
    
    // 转场动画
    CATransition *anim = [CATransition animation];
    anim.type = @"cube";
    anim.subtype = kCATransitionFromLeft;
    [self.iconView.layer addAnimation:anim forKey:nil];
}

- (IBAction)down:(id)sender {
    self.index++;
    
    if (self.index == 9) {
        self.index = 0;
    }
    
    NSString *filename = [NSString stringWithFormat:@"%d.jpg", self.index+1];
    self.iconView.image = [UIImage imageNamed:filename];
    
    
    
    // 转场动画
    CATransition *anim = [CATransition animation];
    anim.type = kCATransitionReveal;
    anim.subtype = kCATransitionFromRight;
    
    
    // 起始进度和结束进度
//    anim.startProgress = 0.5;
//    anim.endProgress = 0.7;
    
    
    [self.iconView.layer addAnimation:anim forKey:nil];
}

@end
