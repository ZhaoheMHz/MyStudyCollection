//
//  ViewController.m
//  01-UIDynamic
//
//  Created by 赵赤赤 on 15/10/12.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (strong, nonatomic) UIDynamicAnimator *animator;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentControl;
@property (weak, nonatomic) IBOutlet UILabel *label1;
@property (weak, nonatomic) IBOutlet UILabel *label2;
@property (weak, nonatomic) IBOutlet UILabel *label3;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.blueView.transform = CGAffineTransformMakeRotation(M_PI_4);
    self.segmentControl.transform = CGAffineTransformMakeScale(1, 0.3);
}

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        // 1.创建物理仿真器ReferenceView:仿真范围
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    
    return _animator;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 2.创建物理仿真行为---->重力行为(items:物理仿真元素)
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc] initWithItems:@[self.blueView, self.label1, self.label2, self.label3]];
    
    // 设置重力方向
//    gravity.gravityDirection = CGVectorMake(1, 5);
//    gravity.angle = M_PI_4;
    // 设置重力加速度
//    gravity.magnitude = 10;
    
    // 3.创建碰撞检测行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc] initWithItems:@[self.blueView, self.label1, self.label2, self.label3]];
    
    // 设置固定不变的元素
    [collision addBoundaryWithIdentifier:@"qqq" fromPoint:self.segmentControl.frame.origin toPoint:CGPointMake(self.segmentControl.frame.origin.x+self.segmentControl.frame.size.width, self.segmentControl.frame.origin.y+self.segmentControl.frame.size.height)];
    
    // 用贝赛尔曲线画一个圆
//    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 320, 320)];
//    [collision addBoundaryWithIdentifier:@"zzz" forPath:path];
    
    // 将仿真范围设置为碰撞的边界
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
    // 添加属性行为
    UIDynamicItemBehavior *items = [[UIDynamicItemBehavior alloc] initWithItems:@[self.blueView, self.label1, self.label2, self.label3]];
    // 弹性
    items.elasticity = 1;
    
    // 4.添加 物理仿真行为 到 物理仿真器
    [self.animator addBehavior:gravity];
    [self.animator addBehavior:collision];
    [self.animator addBehavior:items];
}

@end
