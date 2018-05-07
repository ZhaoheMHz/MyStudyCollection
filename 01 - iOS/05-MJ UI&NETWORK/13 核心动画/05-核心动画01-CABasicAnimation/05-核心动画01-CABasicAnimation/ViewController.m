//
//  ViewController.m
//  05-核心动画01-CABasicAnimation
//
//  Created by 赵赤赤 on 16/3/28.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) CALayer *layer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.layer = [[CALayer alloc] init];
    self.layer.position = CGPointMake(100, 100);
    self.layer.bounds = CGRectMake(0, 0, 100, 100);
    self.layer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:self.layer];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self testPosition];
}

- (void)testSome {
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画，调整哪个属性来执行动画
//    anim.keyPath = @"transform.rotation";
//    anim.toValue = @(M_PI_4);
    
    anim.keyPath = @"transform.scale";
    anim.toValue = @(1.5);
    
    anim.duration = 2.0;
    
    /** 两个属性配合使用，让图层保持执行完毕后的状态 */
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

- (void)testTransform {
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画，调整哪个属性来执行动画
    anim.keyPath = @"transform";
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
    anim.duration = 2.0;
    
    /** 两个属性配合使用，让图层保持执行完毕后的状态 */
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

- (void)testScale {
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画，调整哪个属性来执行动画
    anim.keyPath = @"bounds";
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    anim.duration = 2.0;
    
    /** 两个属性配合使用，让图层保持执行完毕后的状态 */
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

- (void)testPosition {
    // 1.创建动画对象
    CABasicAnimation *anim = [CABasicAnimation animation];
    
    // 2.设置动画对象
    // keyPath决定了执行怎样的动画，调整哪个属性来执行动画
    anim.keyPath = @"position";
//    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    
    
//    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    // byValue是到多少
    anim.byValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    anim.duration = 2.0;
    
    /** 两个属性配合使用，让图层保持执行完毕后的状态 */
    // 动画执行完毕后不要删除动画
    anim.removedOnCompletion = NO;
    // 保持最新状态
    anim.fillMode = kCAFillModeForwards;
    
    // 3.添加动画
    [self.layer addAnimation:anim forKey:nil];
}

@end
