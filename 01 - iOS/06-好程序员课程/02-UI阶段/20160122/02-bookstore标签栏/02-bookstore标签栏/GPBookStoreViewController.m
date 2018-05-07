//
//  GPBookStoreViewController.m
//  02-bookstore标签栏
//
//  Created by 哲 肖 on 16/1/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPBookStoreViewController.h"
#import "GPTabView.h"

#import "GPOCListView.h"
#import "GPJavaListView.h"
#import "GPCListView.h"

@interface GPBookStoreViewController ()<GPTabViewDelegate>

//1.为什么用weak呢? 用strong行不行呢?

@property (nonatomic,weak)GPOCListView * ocListView;

@property (nonatomic,weak)GPJavaListView * javaListView;

@property (nonatomic,weak)GPCListView * cListView;

@end

@implementation GPBookStoreViewController

//懒加载视图,保证视图只创建一次,以后每次调用都是重复利用
- (GPOCListView *)ocListView
{
    if(_ocListView == nil)
    {
        GPOCListView * ocListView = [GPOCListView ocListView];
        [self.view addSubview:ocListView];
        _ocListView = ocListView;
    }
    return _ocListView;
}

- (GPJavaListView *)javaListView
{
    if(_javaListView == nil)
    {
        GPJavaListView * javaListView = [GPJavaListView javaListView];
        [self.view addSubview:javaListView];
        _javaListView = javaListView;
    }
    return _javaListView;
}

- (GPCListView *)cListView
{
    if(_cListView == nil)
    {
        GPCListView * cListView = [GPCListView cListView];
        [self.view addSubview:cListView];
        _cListView = cListView;
    }
    return _cListView;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //希望内部的按钮是数量是可控
    //1.创建对象
    GPTabView * tabView = [GPTabView tabView];
    //2.建立父子关系
    [self.view addSubview:tabView];
    //3.设置Frame
    //4.设置代理
    tabView.delegate = self;
    
    
    //创建所有的item按钮
    UIButton * item1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [item1 setTitle:@"OC" forState:UIControlStateNormal];
    item1.backgroundColor = [UIColor grayColor];

    UIButton * item2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [item2 setTitle:@"Java" forState:UIControlStateNormal];
    item2.backgroundColor = [UIColor purpleColor];
    
    UIButton * item3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [item3 setTitle:@"C" forState:UIControlStateNormal];
    item3.backgroundColor = [UIColor orangeColor];
    
    //然后传递给tabView
    tabView.items = @[item1,item2,item3];
    
    tabView.backgroundColor = [UIColor yellowColor];
    
}

- (void)tabViewItemDidSelected:(GPTabView *)tabView item:(UIButton *)item index:(NSInteger)index
{
    NSLog(@" 点击了 %ld",index);
    
    //根据index,确定点击哪一个具体的按钮
    if(index == 0)
    {
        
//        self.ocListView;
        [self.view bringSubviewToFront:self.ocListView];
        
        //显示OC的视图
//        GPOCListView * ocListView = [GPOCListView ocListView];
//        [self.view addSubview:ocListView];
//        
//        [self.view bringSubviewToFront:tabView];
    }
    else if (index == 1)
    {
//        self.javaListView;
        GPJavaListView * tmp = self.javaListView;
        [self.view bringSubviewToFront:tmp];
        //显示java的视图
//        GPJavaListView * javaListView = [GPJavaListView javaListView];
//        [self.view addSubview:javaListView];
        
//        [self.view bringSubviewToFront:tabView];
    }
    else if (index == 2)
    {
        
//        self.cListView;
        [self.view bringSubviewToFront:self.cListView];
        
        //显示c语言的视图
//        GPCListView * cListView = [GPCListView cListView];
//        [self.view addSubview:cListView];
        
//        [self.view bringSubviewToFront:tabView];
    }
    
     [self.view bringSubviewToFront:tabView];
    
}//end method

@end
