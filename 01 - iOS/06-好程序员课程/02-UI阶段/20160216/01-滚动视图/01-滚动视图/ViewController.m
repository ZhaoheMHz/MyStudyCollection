//
//  ViewController.m
//  01-滚动视图
//
//  Created by 哲 肖 on 16/2/16.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic, weak)UIImageView * pictureImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //滚动视图,专门用来呈现可滚动查看的内容
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = [UIColor redColor];
    
    //用来设置,滚动区域大小
    //scrollView 某个方向的滚动区域必须大于自身Frame值才行
//    scrollView.contentSize = CGSizeMake(1000, 1000);
    
    
    //scrollView 中添加一个子控件,显示具体内容
    UIImageView * pictureImageView = [[UIImageView alloc] init];
    [scrollView addSubview:pictureImageView];
    pictureImageView.image = [UIImage imageNamed:@"mobihua.jpg"];
//    pictureImageView.frame = scrollView.bounds;
    pictureImageView.frame = CGRectMake(0, 0, 863, 1883);
    self.pictureImageView = pictureImageView;
    
    //有多少个因素能够影响scrollView的滑动
    //1.就是contentSize小于了scrollView某个方向的Frame值(宽度,高度)
    //2.scrollEnabled设置为NO了
    //3.userInteractionEnabled禁止了用户交互
    //contentSize用来设置scrollView横向与纵向可滚动的最大范围
    scrollView.contentSize = CGSizeMake(863, 1883);
//    scrollView.scrollEnabled = NO;
//    scrollView.userInteractionEnabled = NO;
    
    
    //内容偏移量,设置scrollView的内容向某一个方向偏移多少
//    scrollView.contentOffset = CGPointMake(200, 200);
    
    //(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
    //设置内容距离scrollView边缘的距离
    //只有触发一次滚动之后,才会生效
//    scrollView.contentInset = UIEdgeInsetsMake(100, 100, 110, 200);
    
    //设置滚动条是否可见
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    //设置代理
    scrollView.delegate = self;
    
    //设置最大/最小缩放的倍数
    scrollView.maximumZoomScale = 2.0;
    scrollView.minimumZoomScale = 0.5;
    
}

#pragma mark UIScrollViewDelegate
//返回希望能够进行放大或者缩小的被UIScrollView管理的具体视图
//如果没有设置maximumZoomScale,minimumZoomScale属性,那么该方法不会被正确的调用
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.pictureImageView;
}

//只要contentOffset发生了变化,就会立即调用该代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;
{
//    NSLog(@"内容偏移 %@",NSStringFromCGPoint(scrollView.contentOffset));
    
    //内容最大的偏移量是多少(x,y)两个方向
    //y方向上的最大偏移量
    CGFloat maxY =  (scrollView.contentSize.height - scrollView.frame.size.height);
    //x方向的最大偏移量
    CGFloat maxX = (scrollView.contentSize.width - scrollView.frame.size.width);
    
}

//将要开始退拽内容的时候,调用一次
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    NSLog(@"scrollViewWillBeginDragging");
}

//当结束拖拽内容的时候会立即调用一次
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDragging");
    
}







@end
