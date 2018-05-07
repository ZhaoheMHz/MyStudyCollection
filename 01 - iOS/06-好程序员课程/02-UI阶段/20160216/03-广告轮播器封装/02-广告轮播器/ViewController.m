//
//  ViewController.m
//  02-广告轮播器
//
//  Created by 哲 肖 on 16/2/16.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "ViewController.h"
#import "GPADSView.h"

@interface ViewController ()<GPADSViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    GPADSView * adsView = [GPADSView adsViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    [self.view addSubview:adsView];
    adsView.backgroundColor = [UIColor yellowColor];
    
    adsView.imagesName = @[@"ad_00",@"ad_01",@"ad_02",@"ad_03",@"ad_04"];
//    adsView.delegate = self;
    
    //block,以及代理什么时候要用到啊? 封装变化点,解决类耦合
    //block与代理之间的区别
    //1.block是在代理之后出现的技术,比代理更加灵活,但是可读性不好
    //2.代理在4.x之前一直都在使用,清晰明了,原生的组件变化点的封装基本都是用的是代理的方式(能够使得使用者,快速的开心的看出来有哪些方法,何时调用)
    [adsView setAdsViewDidSelectedBlock:^(GPADSView * adsView, NSInteger index, NSString * imageName)
    {
        NSLog(@"block 点击 %@",imageName);
    }];
    
    
}

#pragma mark GPADSViewDelegate
- (void)adsViewDidSelected:(GPADSView *)adsView index:(NSInteger)index imageName:(NSString *)imageName
{
    NSLog(@"点击的是 %@",imageName);
}


@end
