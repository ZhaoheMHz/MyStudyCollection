//
//  GPADSView.m
//  02-广告轮播器
//
//  Created by 哲 肖 on 16/2/16.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPADSView.h"

@interface GPADSView()<UIScrollViewDelegate>

@property (nonatomic, weak)UIScrollView * scrollView;

@property (nonatomic, weak)UIPageControl * pageController;

@property (nonatomic, strong)NSTimer * timer;

@end

@implementation GPADSView

+(id)adsViewWithFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //添加子控件
        //1.scrollView对象
        
        UIScrollView * scrollView = [[UIScrollView alloc] init];
        [self addSubview:scrollView];
        scrollView.frame = CGRectMake(0, 0, frame.size.width, 200);
        scrollView.backgroundColor = [UIColor redColor];
        self.scrollView = scrollView;
        
        scrollView.delegate = self;
        
        //一次性设置,不需要动态数据参与当中的属性设置,我们最好都集中在init方法中写,方便排错
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        
        //UIScrollView 当中显示的图片内容,是动态发生变化的,对于当前这个组件来说,就是一个变化点
        
        //2.pageControl对象
        UIPageControl * pageController = [[UIPageControl alloc] init];
        [self addSubview:pageController];
        
        pageController.frame = CGRectMake(0, 180, scrollView.frame.size.width, 20);
        pageController.backgroundColor = [UIColor redColor];
        
        //设置一共有多少个提示视图(小圆点)
//        pageController.numberOfPages = 5;
        //当前指示页面的小点颜色
        pageController.currentPageIndicatorTintColor = [UIColor greenColor];
        //其它小点颜色
        pageController.pageIndicatorTintColor = [UIColor grayColor];
        //当前指示第几个小点上
        pageController.currentPage = 0;
        self.pageController = pageController;

 
        
    }
    return self;
}

- (void)setImagesName:(NSArray *)imagesName
{
    _imagesName = imagesName;
    
    //向UIScrollView添加子控件
    for(int i = 0; i < imagesName.count;i++)
    {
        
        UIButton * imageView = [UIButton buttonWithType:UIButtonTypeCustom];//[[UIImageView alloc] init];
        [self.scrollView addSubview:imageView];
//        imageView.image = [UIImage imageNamed:imagesName[i]];
        [imageView setBackgroundImage:[UIImage imageNamed:imagesName[i]] forState:UIControlStateNormal];
        
        //Frame 的设置参考谁好一点?
        //一个组件的Frame设置,最好参考其直接管理者(也就是父亲视图)
        CGFloat imageViewX = i * self.scrollView.frame.size.width;
        CGFloat imageViewY = 0;
        CGFloat imageViewW = self.scrollView.frame.size.width;
        CGFloat imageViewH = self.scrollView.frame.size.height;
        
        imageView.frame = CGRectMake(imageViewX, imageViewY, imageViewW, imageViewH);
        
        //监听事件
        [imageView addTarget:self action:@selector(btnTouch:) forControlEvents:UIControlEventTouchUpInside];
        //添加一个临时标记
        imageView.tag = i;
        
    }//end for
    
    //根据图片的具体数量,计算出contentSize
    self.scrollView.contentSize = CGSizeMake(imagesName.count * self.scrollView.frame.size.width, 0);
    //根据动态数据,设置总的指示器小点个数
    self.pageController.numberOfPages = imagesName.count;
    
    //启动定时器
    [self createTimer];
    
}//end method


#pragma mark UIScrollViewDelegate
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


#pragma mark privateMethod

- (void)createTimer
{
    NSTimer * timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(autoScroll) userInfo:nil repeats:YES];
    self.timer = timer;
    
    //把timer对象加入到循环回路中,NSRunLoopCommonModes通信模式
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
    
}

- (void)autoScroll
{
//    NSLog(@"开始自动滚动了");
    //scrollView滚动效果,实际上就是改变bounds也就是改变contentOffSet某一个方向的值
    //当前显示在第几页 *scrollView.width
    //如果已经显示到最后一页,那么归0
    NSInteger currentPage =  self.pageController.currentPage >= self.imagesName.count - 1 ? 0 : self.pageController.currentPage + 1;
    
    CGFloat offsetX = currentPage * self.scrollView.frame.size.width;
    
    self.scrollView.contentOffset = CGPointMake(offsetX, 0);
    
}

- (void)btnTouch:(UIButton *)btn
{
//    NSLog(@"点击的是 %@",self.imagesName[btn.tag]);
    
    //触发代理方法
    [self.delegate adsViewDidSelected:self index:btn.tag imageName:self.imagesName[btn.tag]];
    
    //出发block回调
    if(self.adsViewDidSelectedBlock)
    {
        self.adsViewDidSelectedBlock(self,btn.tag,self.imagesName[btn.tag]);
    }
}

@end
