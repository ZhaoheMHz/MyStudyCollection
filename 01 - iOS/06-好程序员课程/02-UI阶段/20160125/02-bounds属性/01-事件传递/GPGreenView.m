//
//  GPGreenView.m
//  01-事件传递
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPGreenView.h"

@implementation GPGreenView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
 
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    UITouch * touch = [touches anyObject];
    
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint prePoint = [touch previousLocationInView:self];
    
    //bounds属性x,y默认都是0,0,但是x,y值是可以发生改变
    //bounds 最主要的作用就是,改变当前视图所有子空间相对于自己的位置
    //(0,0,w,h)
    CGRect tmpBounds = self.bounds;
    tmpBounds.origin.x += prePoint.x -currentPoint.x;
    tmpBounds.origin.y += prePoint.y - currentPoint.y;
    self.bounds = tmpBounds;
    
    NSLog(@"%@",NSStringFromCGRect(self.bounds));
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{

}

@end
