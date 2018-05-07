//
//  ViewController.m
//  06-重绘(刷帧)
//
//  Created by 赵赤赤 on 16/3/27.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "MJView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet MJView *circleView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (IBAction)sizeChanged:(UISlider *)sender {
    self.circleView.radius = sender.value;
    // 重绘(这个方法内部会重新调用drawRect进行绘制，并且之前绘制的内容会清掉)
    [self.circleView setNeedsDisplay];
}

@end
