//
//  ViewController.m
//  02-广告轮播器
//
//  Created by 哲 肖 on 16/2/16.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property (nonatomic ,weak)UIPageControl * pageController;

@property (nonatomic, weak)UIScrollView * scrollView;

@property (nonatomic, strong)NSTimer * timer ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    //1.创建容器视图
    UIScrollView * scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView];
    scrollView.frame = CGRectMake(0, 0, self.view.frame.size.width, 200);
    scrollView.backgroundColor = [UIColor yellowColor];
    self.scrollView = scrollView;
    
    //2.添加内容子视图
    for(int i = 0; i < 5; i++)
    {
        UIImageView * pictImageView = [[UIImageView alloc] init];
        [scrollView addSubview:pictImageView];
        NSString * name = [NSString stringWithFormat:@"ad_%02d",i];
        pictImageView.image = [UIImage imageNamed:name];
        
         //设置Frame
        CGFloat pictW = scrollView.frame.size.width;
        CGFloat pictH = scrollView.frame.size.height;
        CGFloat pictX = i * pictW;//i * scrollView.frame.size.width
        CGFloat pictY = 0;
        
        pictImageView.frame = CGRectMake(pictX, pictY, pictW, pictH);
    }//end for
    
    //设置contentSize,只能够横向滚动
    scrollView.contentSize = CGSizeMake(5 * scrollView.frame.size.width, 0);
    scrollView.showsHorizontalScrollIndicator = NO;
    //是否支持分页功能
    scrollView.pagingEnabled = YES;
    
    
    //指示器,用来提示用户当前显示到的具体页面提示
    UIPageControl * pageController = [[UIPageControl alloc] init];
//    [scrollView addSubview:pageController];
    [self.view addSubview:pageController];
    
    pageController.frame = CGRectMake(0, 180, scrollView.frame.size.width, 20);
    pageController.backgroundColor = [UIColor redColor];
    
    //设置一共有多少个提示视图(小圆点)
    pageController.numberOfPages = 5;
    //当前指示页面的小点颜色
    pageController.currentPageIndicatorTintColor = [UIColor greenColor];
    //其它小点颜色
    pageController.pageIndicatorTintColor = [UIColor grayColor];
    //当前指示第几个小点上
    pageController.currentPage = 0;
    
    //保存全局变量
    self.pageController = pageController;

    //设置代理对象
    scrollView.delegate = self;
    
    
    //TimeInterval 时间间隔
    //target
    //selector 要执行的方法
    //userInfo 是否有参数要传递给selector方法
    //repeats 是否重复执行
    //scheduledTimerWithTimeInterval 一点调用后,会自动的立即执行,并且返回一个timre对象
    //timerWithTimeInterval 必须手动调用执行才行,并且返回一个timer对象,[timer fire]才会执行selector方法;
   
    
//    [self autoScroll];
    [self createTimer];
    
    
    UIScrollView * scrollView2 = [[UIScrollView alloc] init];
    [self.view addSubview:scrollView2];
    scrollView2.frame = CGRectMake(0, 300, self.view.frame.size.width, 200);
    scrollView2.backgroundColor = [UIColor yellowColor];
    scrollView2.contentSize = CGSizeMake(1000, 1000);
    
    
}

//当前显示到了第几个页面
//
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //1.时时获得当前偏移量
    CGFloat offSetX = scrollView.contentOffset.x;
    //计算出当前滚动到的具体页数
    NSInteger currentPage = (offSetX + scrollView.frame.size.width * 0.5 )/ scrollView.frame.size.width;
    
    //2.设置pegeControler
    self.pageController.currentPage = currentPage;
}

//为了防止NSTimer 产生的时间累积效果产生的屏幕视图闪动,我们在人为拖拽的时候,取消自动滚动效果
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //取消timer功能
    //一旦调用了invalidate 方法之后,timer对象是不能够再从新复活
    [self.timer invalidate];
    //清空一下timer对象
    self.timer = nil;
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //从新启动timer对象
//    [self.timer fire]; //调用该方法是无用的,一旦调用了invalidate是不能够再次复活的,只能够重新创建
    [self createTimer];
}

- (void)createTimer
{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    self.timer = timer;
    
    //把timer对象加入到循环回路中,NSRunLoopCommonModes通信模式
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

- (void)autoScroll
{
    NSLog(@"开始自动滚动了");
    //scrollView滚动效果,实际上就是改变bounds也就是改变contentOffSet某一个方向的值
    //当前显示在第几页 *scrollView.width
    //如果已经显示到最后一页,那么归0
    NSInteger currentPage =  self.pageController.currentPage >= 4 ? 0 : self.pageController.currentPage + 1;
    
    CGFloat offsetX = currentPage * self.scrollView.frame.size.width;
    
    self.scrollView.contentOffset = CGPointMake(offsetX, 0);
    
}


@end
