//
//  GPViewMethodController.m
//  01-UIVIew常用方法
//
//  Created by 哲 肖 on 16/1/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPViewMethodController.h"
#import "MyView.h"

@interface GPViewMethodController ()

@property (nonatomic,weak)UIView * yellowView;

@property (nonatomic,weak)UIView * greenView;

@property (nonatomic,weak)UIView * baseView;

@end

@implementation GPViewMethodController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView * baseView = [[UIView alloc] init];
    [self.view addSubview:baseView];
    baseView.frame = CGRectMake(100,100 , 150, 150);
    baseView.backgroundColor = [UIColor redColor];
    self.baseView = baseView;
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:btn];
    btn.frame = CGRectMake(100, 500, 150, 50);
    btn.backgroundColor = [UIColor grayColor];
    [btn addTarget:self action:@selector(btnTouch) forControlEvents:UIControlEventTouchUpInside];
    
    

    
    //建立父子关系
    UIView * greenView = [[UIView alloc] init];
    //建立父子关系的同时,这个addSubview内部还干了什么其他事情? 会在父亲视图中,保存一个子视图的强指针
    [baseView addSubview:greenView];
    greenView.frame = baseView.bounds;
    greenView.backgroundColor = [UIColor greenColor];
    self.greenView = greenView;
    //使用tag作为视图的临时标记,方便在父亲对象中直接找到该子视图
    greenView.tag = 10;
    
    
    //建立父子关系
    MyView * yellowView = [[MyView alloc] init];
    //建立父子关系的同时,这个addSubview内部还干了什么其他事情? 会在父亲视图中,保存一个子视图的强指针
    [baseView addSubview:yellowView];
//    yellowView.frame = baseView.bounds;
    yellowView.backgroundColor = [UIColor yellowColor];
    self.yellowView = yellowView;

    //插入一个视图
//    [self.baseView insertSubview:yellowView atIndex:0];
    
    //把新添加的视图,放到某一个视图的后面
//    [self.baseView insertSubview:yellowView belowSubview:greenView];
      //把新添加的视图,放到某一个视图的前面
//    [self.baseView insertSubview:<#(UIView *)#> aboveSubview:<#(UIView *)#>]
    
    
    
}
- (void)btnTouch
{
    [self.baseView bringSubviewToFront:nil];
    
    //把某一个视图放到最上层显示
//    [self.baseView bringSubviewToFront:self.greenView];
    
    //把某一个视图,挪到最后面
//    [self.baseView sendSubviewToBack:self.yellowView];
    //解除父子关系,removeFromSuperview
    //子控件自己与父亲解除关系
//    [self.greenView removeFromSuperview];
    
    //父亲控件与子控件解除父子关系
    
    /*
    //1.获得子控件
     //数组中保存对象的指针,默认是对象的强指针,所以每次调用addSubView方法,都会将该对象的强指针保存到subviews数组中,掉removeFromSuperview方法,会将自己保存在父亲subViews数组中的强指针移除,如果外界再没有强指针指向的话,就会被系统回收
    NSArray * subViews = [self.baseView subviews]; //获得被自己管理的所有子控件对象
    for(UIView * tmpView in subViews)
    {
        //2.取出每一个子视图,并且与父亲解除父子管理关系
        [tmpView removeFromSuperview];
    }
    */
    
    /*
    //通过viewWithTag 找到具体的一个子视图
    //这种方式,不见在实际的开发中过多的使用,因为用数字作为标记,意义不是很明确,而且容易忘记
    UIView * greenView = [self.baseView viewWithTag:10];
    [greenView removeFromSuperview];
    */
    
    
    
}

@end
