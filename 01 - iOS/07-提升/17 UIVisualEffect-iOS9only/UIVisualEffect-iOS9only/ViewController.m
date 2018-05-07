//
//  ViewController.m
//  UIVisualEffect-iOS9only
//
//  Created by 赵赤赤 on 16/6/22.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIVisualEffectView *effectView;

@property (nonatomic, strong) UILabel *effectLabel;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@property (nonatomic, assign) BOOL isHidden;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.imageView.image = [UIImage imageNamed:@"photo_background.jpg"];
    
    self.effectView = [[UIVisualEffectView alloc] initWithFrame:self.view.frame];
    [self.view addSubview:self.effectView];
    
    // 添加询问的label
    self.effectLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height*0.5, self.view.frame.size.width, 30)];
    self.effectLabel.font = [UIFont fontWithName:@"PingFang-SC-Light" size:30];
    self.effectLabel.textColor = [UIColor whiteColor];
    self.effectLabel.textAlignment = NSTextAlignmentCenter;
    self.effectLabel.text = @"What can I do for you?";
    self.effectLabel.alpha = 0;
    [self.effectView addSubview:self.effectLabel];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.isHidden) {
        self.isHidden = !self.isHidden;
        
        // 首先去掉 UIVisualEffectView 原来的 effect。
        self.effectView.effect = nil;
        
        
        // 现在动画添加一个新的 effect
        [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
            self.effectView.effect = effect;
            self.effectLabel.alpha = 1;
            
            CGRect newframe = self.effectLabel.frame;
            newframe.origin.y -= 200;
            self.effectLabel.frame = newframe;
        } completion:^(BOOL finished) {
        }];
    } else {
        self.isHidden = !self.isHidden;
        
        // 现在动画添加一个新的 effect
        [UIView animateWithDuration:1.5 delay:0 usingSpringWithDamping:1.0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            self.effectView.effect = nil;
            self.effectLabel.alpha = 0;
            
            CGRect newframe = CGRectMake(0, self.view.frame.size.height*0.5, self.view.frame.size.width, 30);
            self.effectLabel.frame = newframe;
        } completion:^(BOOL finished) {
        }];
    }
    
}

@end
