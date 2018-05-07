//
//  GPAdsView.m
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPAdsView.h"

@interface GPAdsView()

@property (nonatomic, weak)UIScrollView * scrollView;

@end

@implementation GPAdsView

+(id)adsViewWithFrame:(CGRect)frame
{
    return [[self alloc] initWithFrame:frame];
}

- (id)initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        //创建子控件
        UIScrollView * scrollView = [[UIScrollView alloc] init];
        [self addSubview:scrollView];
        scrollView.frame = self.bounds;
        scrollView.pagingEnabled = YES;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.backgroundColor = [UIColor redColor];
        self.scrollView = scrollView;
        
    }
    return self;
}

- (void)setAdsArray:(NSArray *)adsArray
{
    _adsArray = adsArray;
    
    for(int i = 0; i < adsArray.count;i++)
    {
        UIButton * adsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.scrollView addSubview:adsButton];
        
        //取出对应的模型
        GPADS * ads = adsArray[i];
        [adsButton setBackgroundImage:[UIImage imageNamed:ads.icon] forState:UIControlStateNormal];
        
        //计算Frame值
        CGFloat adsButtonX = i * self.scrollView.frame.size.width;
        CGFloat adsButtonY = 0;
        CGFloat adsButtonW = self.scrollView.frame.size.width;
        CGFloat adsButtonH = self.scrollView.frame.size.height;
        adsButton.frame = CGRectMake(adsButtonX, adsButtonY, adsButtonW, adsButtonH);
        
    }//end for
    
    //计算contentSize
    self.scrollView.contentSize = CGSizeMake(adsArray.count * self.scrollView.frame.size.width, 0);
    
}//end method

@end
