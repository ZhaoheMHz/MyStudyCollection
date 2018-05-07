//
//  SpringView.m
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "SpringView.h"

@implementation SpringView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //振幅(0~1之间，默认是1，不震动)
        self.attchment.damping = 0.1;
        
        //频率（0~，默认是0）
        self.attchment.frequency = 1.0;
        
        
        //观察者
        [self.box addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:nil];
        
        //增加一个碰撞
        UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[self.box]];
        collision.translatesReferenceBoundsIntoBoundary = YES;
        [self.animator addBehavior:collision];
        
        //添加一个重力
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.box]];
        [self.animator addBehavior:gravity];
        
        
    }
    return self;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    //box位置发生变化，这个方法就会被响应
    
    //通知重新画图
    [self setNeedsDisplay];
}

-(void)dealloc{
    //释放掉观察者
    //用完一定要释放，否则崩溃
    [self.box removeObserver:self forKeyPath:@"center"];
}

@end
