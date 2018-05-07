//
//  ViewController.m
//  02-UIDynamic-捕捉行为
//
//  Created by 赵赤赤 on 15/10/13.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIView *iconView;
@property (nonatomic, strong) UIDynamicAnimator *animator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (UIDynamicAnimator *)animator {
    if (!_animator) {
        _animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
    }
    
    return _animator;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.iconView snapToPoint:point];
    [self.animator addBehavior:snap];
}

@end
