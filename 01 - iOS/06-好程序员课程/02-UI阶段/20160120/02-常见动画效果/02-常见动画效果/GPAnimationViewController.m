//
//  GPAnimationViewController.m
//  02-常见动画效果
//
//  Created by 哲 肖 on 16/1/20.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPAnimationViewController.h"
#import "MyView.h"

/*
 1.基于视图动画效果,使用与渐变性动画
   转场动画-重一个视图转换到另外一个视图的时使用的动画效果
 2.形变效果
 3.帧动画效果
 */

@interface GPAnimationViewController ()

@property(nonatomic,weak) UIButton * ballButton;

@property(nonatomic,weak) UIView * redView;
@property(nonatomic,weak) UIView * greenView;

@end

@implementation GPAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    self.view.backgroundColor = [UIColor whiteColor];
    /*
    UIButton * ballButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:ballButton];
    ballButton.frame = CGRectMake(100, 100, 80, 80);
    [ballButton setBackgroundImage:[UIImage imageNamed:@"Ball"] forState:UIControlStateNormal];
    self.ballButton = ballButton;
    */
    
    
    UIView * redView = [[UIView alloc] init];
    [self.view addSubview:redView];
    redView.frame = CGRectMake(100, 100, 100, 100);
    redView.backgroundColor = [UIColor redColor];
    self.redView = redView;
    
    
    UIButton * greenView = [[UIButton alloc] init];
    [self.view addSubview:greenView];
    greenView.frame = CGRectMake(100, 100, 100, 100);
    greenView.backgroundColor = [UIColor greenColor];
    self.greenView = greenView;
    [greenView setBackgroundImage:[UIImage imageNamed:@"head1"] forState:UIControlStateNormal];

    
    UIButton * actionButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:actionButton];
    actionButton.frame = CGRectMake(100, 450, 100, 50);
    actionButton.backgroundColor = [UIColor yellowColor];
    [actionButton addTarget:self action:@selector(actionButtonTouch2) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton * clearButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:clearButton];
    clearButton.frame = CGRectMake(200, 450, 100, 50);
    clearButton.backgroundColor = [UIColor grayColor];
    [clearButton addTarget:self action:@selector(clearButton) forControlEvents:UIControlEventTouchUpInside];



}

- (void)actionButtonTouch2
{
    
    //UIViewAnimationOptionTransitionFlipFromLeft 向左旋转
    //UIViewAnimationOptionTransitionCurlUp 翻页效果
    //UIViewAnimationOptionShowHideTransitionViews 是的FromView 不会被销毁
    //FromView 一旦转场完成之后FromView 会被销毁掉
    //转场动画效果
//    [UIView transitionFromView:self.greenView toView:self.redView duration:2 options:UIViewAnimationOptionTransitionCrossDissolve | UIViewAnimationOptionShowHideTransitionViews completion:nil];
    
    //1.平移
    //不能执行累加效果的屏幕
//    self.greenView.transform = CGAffineTransformMakeTranslation(-100, 0);
    //可以进行累加的,平移
    self.greenView.transform = CGAffineTransformTranslate(self.greenView.transform, 100, 0);
    
    //2.放大缩小
    //
//    self.greenView.transform = CGAffineTransformMakeScale(1.5, 1.5);
    
//    self.greenView.transform =  CGAffineTransformScale(self.greenView.transform, 1.5, 1.5);
    
    //3.旋转
    //180M_PI 90 M_PI_2 45 M_PI_4
//    self.greenView.transform = CGAffineTransformMakeRotation(M_PI_4);
//    self.greenView.transform = CGAffineTransformRotate(self.greenView.transform, M_PI_4);
    
}

- (void)clearButton
{
    //恢复到最初状态
    self.greenView.transform = CGAffineTransformIdentity;
}


- (void)actionButtonTouch
{

    //1.改变Frame的Y值
    //如果想要改变一个视图的Frame中某一个具体的值,不能够使用直接赋值的方式
//    self.ballButton.frame.origin.y += 200;
    //1.要获得视图的Frame,然后整体修改最后赋值

    /*
    //(NSTimeInterval) 动画效果持续的时间
    [UIView animateWithDuration:2
                     animations:^{
        //要执行的具体渐变属性
                         CGRect rect = self.ballButton.frame;
                         rect.origin.y += 200;
                         self.ballButton.frame = rect;
                         
    }];
    */
    
    /*
    [UIView animateWithDuration:2 animations:^{
        
        CGRect rect = self.ballButton.frame;
        rect.origin.y += 200;
        self.ballButton.frame = rect;
        
    } completion:^(BOOL finished) {
        
        //动画效果执行完成之后,要执行什么样的逻辑
        NSLog(@"动画效果执行完成");
//        
//        CGRect rect = self.ballButton.frame;
//        rect.origin.y -= 200;
//        self.ballButton.frame = rect;
        //动画效果是可以嵌套
        [UIView animateWithDuration:2 animations:^{
            
//            CGRect rect = self.ballButton.frame;
//            rect.origin.y -= 200;
//            self.ballButton.frame = rect;
            
            //alpha 是用来控制,视图的透明度 完全不透明1 完全透明0
            self.ballButton.alpha = 0.5;
            
        }];
        
    }];
    */
    
    //(NSTimeInterval) 事件
    //delay 延迟多长事件开始执行动画效果
    //UIViewAnimationOptions 执行一些默认的渐变动画效果
    //UIViewAnimationOptionAutoreverse 执行回路,按照原来的路径回去,但最终回路执行完毕之后,会定在最终结束的位置
    //UIViewAnimationOptionRepeat 重复执行动画效果
    //UIViewAnimationOptionRepeat|UIViewAnimationOptionAutoreverse 组合起来就可以完成钟摆效果
    //UIViewAnimationOptionCurveEaseIn 由慢到快
    //UIViewAnimationOptionCurveEaseOut 由快到慢
    //UIViewAnimationOptionCurveLinear 匀速效果
    
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        CGRect rect = self.ballButton.frame;
        rect.origin.y += 400;
        self.ballButton.frame = rect;
        
    } completion:^(BOOL finished) {
        
    }];
    
    
    
}




@end
