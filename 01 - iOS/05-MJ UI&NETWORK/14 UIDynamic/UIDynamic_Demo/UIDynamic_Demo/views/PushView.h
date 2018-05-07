//
//  PushView.h
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "DynamicView.h"

@interface PushView : DynamicView
{
    //记录第一次按下的点
    CGPoint _firstPoint;
    //记录移动中的点
    CGPoint _movePoint;
    
    //push行为
    UIPushBehavior *_push;
    //橡皮筋
    UIImageView *_imageView;
}
@end
