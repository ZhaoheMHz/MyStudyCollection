//
//  ViewController.m
//  07_IconShake
//
//  Created by baoxu on 16/3/9.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "ViewController.h"

#define ANGLE(angle) (angle)/180.0*M_PI

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.iconImageView.layer.cornerRadius = 20;
}

- (IBAction)start:(id)sender {
    
    CAKeyframeAnimation *anima = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    anima.values = @[@(ANGLE(-3)),@(ANGLE(3)),@(ANGLE(-3))];

    anima.duration = 0.25;
    anima.repeatCount = MAXFLOAT;
    
    anima.removedOnCompletion = NO;
    anima.fillMode = kCAFillModeForwards;
    
    [self.iconImageView.layer addAnimation:anima forKey:@"shake"];
    
    
}

- (IBAction)stop {
    [self.iconImageView.layer removeAnimationForKey:@"shake"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
