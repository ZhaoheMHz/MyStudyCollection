//
//  PushView.m
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "PushView.h"

@implementation PushView


-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        //改变box的位置
        self.box.center = CGPointMake(self.center.x, 200);
        //旋转一下
        self.box.transform = CGAffineTransformMakeRotation(M_PI_4);
        
        //小蓝块
        UIView *blueView = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 20, 20)];
        blueView.backgroundColor = [UIColor blueColor];
        
        [self addSubview:blueView];
        
        //1.定义一个手势
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
        
        [self addGestureRecognizer:pan];
        
        //2.添加橡皮筋起点
        UIImage *image = [UIImage imageNamed:@"AttachmentPoint"];
        _imageView = [[UIImageView alloc]initWithImage:image];
        
        _imageView.hidden = YES;
        [self addSubview:_imageView];
        
        //3.实例化推动行为
        _push = [[UIPushBehavior alloc]initWithItems:@[self.box] mode:UIPushBehaviorModeInstantaneous];
        [self.animator addBehavior:_push];
        
        //4.为items添加碰撞
        UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[self.box,blueView]];
        //是否以参照视图的边缘为碰撞界线
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        //ios7之后，添加了对视图颜色处理的功能，能够过滤掉之前图片的颜色
        _imageView.tintColor = [UIColor blueColor];
        //重新绘一遍
        _imageView.image = [_imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        
        [self.animator addBehavior:collision];
    }
    return self;
}


#pragma  mark -拖动手势-
//只要拖动手势有托动行为，这个方法就会被响应，多次被调用的
-(void)pan:(UIPanGestureRecognizer *)recognizer{
    //获取手势所在的点
    CGPoint location = [recognizer locationInView:self];
    //判断一下当前手势是怎样动的，拖动手势是一个连续性的手势，需要判断
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        //按下手指，皮筋要在这里开始，记录皮筋的起点
        _firstPoint = location;
        
        //添加一个图像标记手势的起点
        _imageView.hidden = NO;
        _imageView.center = location;
    }else if(recognizer.state == UIGestureRecognizerStateChanged){
        //根据手势的改变，绘制橡皮筋
        //移动到的点需要记录下来
        _movePoint = location;
        //调用drawRect方法
        [self setNeedsDisplay];
    }else if(recognizer.state == UIGestureRecognizerStateEnded){
        //松开手指，反向弹射box，此时需要给box一个方向的推力
        /**
         *  1.推的方向
            2.推的力量
            3.执行
         */
        CGPoint endPoint = location;
        
        CGPoint offset = CGPointMake(_firstPoint.x - endPoint.x, _firstPoint.y - endPoint.y);
        
        //方向,角度计算（Y/X）
        CGFloat angle = atan2(offset.y, offset.x);
        _push.angle = angle;
        
        //力量，力量与拉伸长度（对角线）成正比，所以开平方计算
        CGFloat distance = sqrtf(offset.x * offset.x + offset.y * offset.y);
        //推动行为的力量属性
        _push.magnitude = distance*0.1;
        
        //对于单次的推动，需要设置下面的属性
        _push.active = YES;
        
        //清理工作
        _imageView.hidden = YES;
        
        _firstPoint = CGPointZero;
        _movePoint = CGPointZero;
        [self setNeedsDisplay];
    }
    
}




- (void)drawRect:(CGRect)rect {
    // Drawing code
    //1.获取上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //2.设置路径
    //起点
    CGContextMoveToPoint(context, _firstPoint.x, _firstPoint.y);
    //终点
    CGContextAddLineToPoint(context, _movePoint.x, _movePoint.y);
    //3.设置线的属性
    //线宽
    CGContextSetLineWidth(context, 5.0);
    //颜色
    [[UIColor darkGrayColor] set];
    //虚线
    CGFloat lengths[] = {20,5};
    CGContextSetLineDash(context, 0, lengths, 2);
    
    
    //4.绘图
    CGContextStrokePath(context);
    
}


@end
