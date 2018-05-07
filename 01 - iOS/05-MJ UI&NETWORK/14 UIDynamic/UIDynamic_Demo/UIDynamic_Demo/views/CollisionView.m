//
//  CollisionView.m
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "CollisionView.h"

@implementation CollisionView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        UIView *redView = [[UIView alloc]initWithFrame:CGRectMake(0, 300, 150, 20)];
        redView.backgroundColor = [UIColor redColor];
        [self addSubview:redView];
        
        UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(110, 120, 100, 100)];
        blueView.backgroundColor = [UIColor blueColor];
        [self addSubview:blueView];
        
        
        //添加碰撞试验
        UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[blueView]];
        collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:collision];
        
        CGFloat toX = redView.frame.size.width;
        CGFloat toY = redView.frame.origin. y+ redView.frame.size.height;
        
        [collision addBoundaryWithIdentifier:@"red" fromPoint:redView.frame.origin toPoint:CGPointMake(toX, toY)];
        //设置代理
        collision.collisionDelegate = self;
        
        //重力
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[blueView]];
        [self.animator addBehavior:gravity];
        
        
        //设置物体属性
        UIDynamicItemBehavior *itme = [[UIDynamicItemBehavior alloc]initWithItems:@[blueView]];
        //弹力系数，0~1之间，0是不弹，1是最弹
        itme.elasticity = 1.0;
        
        [self.animator addBehavior:itme];
        
        
        //能够跟踪碰撞实际的情况
//        collision.action = ^{
//            NSLog(@"%@",NSStringFromCGRect(blueView.frame));
//        };
    }
    return self;
}
//开始撞击
-(void)collisionBehavior:(UICollisionBehavior *)behavior beganContactForItem:(id<UIDynamicItem>)item withBoundaryIdentifier:(id<NSCopying>)identifier atPoint:(CGPoint)p{

    NSLog(@"identifier:%@",identifier);
    
    NSString *ID = [NSString stringWithFormat:@"%@",identifier];
    
    UIView *blueView = (UIView *)item;
    
    if ([ID isEqualToString:@"red"]) {
        //跟红板相撞，改变颜色
        blueView.backgroundColor = [UIColor greenColor];
        //结束后恢复颜色
        [UIView animateWithDuration:0.5f animations:^{
            blueView.backgroundColor = [UIColor blueColor];
        }];
        
    }
    
    
}




@end
