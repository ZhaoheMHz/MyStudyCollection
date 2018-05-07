//
//  DynamicViewController.m
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "DynamicViewController.h"
#import "DynamicView.h"
#import "GravityView.h"
#import "SnapView.h"
#import "PushView.h"
#import "AttachmentView.h"
#import "SpringView.h"
#import "CollisionView.h"

@interface DynamicViewController ()

@end

@implementation DynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
 
    DynamicView *dynamicView = nil;
    
    switch (self.type) {
        case DynamicTypeGravity:
            //重力加速度效果
            dynamicView = [[GravityView alloc]initWithFrame:self.view.bounds];
        
            break;
        case DynamicTypeSnap:
            //吸附行为效果
            dynamicView = [[SnapView alloc]initWithFrame:self.view.bounds];
            
            break;
        case DynamicTypePush:
            //推动行为效果
            dynamicView = [[PushView alloc]initWithFrame:self.view.bounds];
            
            break;
        case DynamicTypeAttchment:
            //刚性附加行为效果
            dynamicView = [[AttachmentView alloc]initWithFrame:self.view.bounds];
            
            break;
        case DynamicTypeSpring:
            //弹性附加行为效果
            dynamicView = [[SpringView alloc]initWithFrame:self.view.bounds];
            
            break;
        case DynamicTypeCollision:
            //碰撞检测行为效果
            dynamicView = [[CollisionView alloc]initWithFrame:self.view.bounds];
            
            break;
            
        default:
            break;
    }
    
    
    
    [self.view addSubview:dynamicView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
