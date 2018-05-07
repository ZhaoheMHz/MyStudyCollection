//
//  AttachmentView.m
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "AttachmentView.h"

@interface AttachmentView ()

@end



@implementation AttachmentView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.box.center = CGPointMake(self.box.center.x, 200);
        
        
        //添加一个手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
        [self addGestureRecognizer:pan];
        
        
        UIOffset offset = UIOffsetMake(0, 0);
        
        CGPoint anchor = CGPointMake(self.box.center.x, self.box.center.y-100);
        
        //这个行为是以Anchor点为基准的，跟着它来动
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc]initWithItem:self.box offsetFromCenter:offset attachedToAnchor:anchor];
        
        [self.animator addBehavior:attachment];
        
        _attchment = attachment;
        
        //组装拖布
        //定位点（把手），使用图像视图
        
        UIImage *image = [UIImage imageNamed:@"AttachmentPoint"];

        _anchorImage = [[UIImageView alloc]initWithImage:image];
        
        _anchorImage.center = anchor;
        
        [self addSubview:_anchorImage];
        
        //拖布头与杆的连接点，也使用图像视图
        _offsetImage = [[UIImageView alloc]initWithImage:image];
        
        CGFloat x = self.box.bounds.size.width/2 + offset.horizontal;
        CGFloat y = self.box.bounds.size.height/2 + offset.vertical;
        
        _offsetImage.center = CGPointMake(x, y);
        
        [self.box addSubview:_offsetImage];
        
        //还差虚线，在drawRect方法里面实现
        
    }
    return self;
}
-(void)pan:(UIPanGestureRecognizer*)recognizer{
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        CGPoint location = [recognizer locationInView:self];
        
        //改变box的位置
        _attchment.anchorPoint = location;
        
        //改变把手的位置
        _anchorImage.center = location;
        
        [self setNeedsDisplay];
    }
}


- (void)drawRect:(CGRect)rect {

    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(context, _anchorImage.center.x, _anchorImage.center.y);
    
    //拿到偏移点相对于父视图的坐标
    //把一个点从一个坐标系转换到接收者的坐标系
    CGPoint p = [self convertPoint:_offsetImage.center fromView:self.box];
//    NSLog(@"%f,%f",p.x,p.y);

    CGContextAddLineToPoint(context, p.x, p.y);
    
    CGFloat lengths[] = {10.0,8.0};
    CGContextSetLineDash(context, 0.0, lengths, 2);
    
    CGContextSetLineWidth(context, 5.0);
    
    CGContextDrawPath(context, kCGPathStroke);
}


@end
