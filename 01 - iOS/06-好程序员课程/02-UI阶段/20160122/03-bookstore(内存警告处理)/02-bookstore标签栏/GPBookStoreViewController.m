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


//记录当前用户正在查看那个具体的视图
@property (nonatomic,weak)UIView * currentShowView;

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
    [self setItemWithTitle:@"OC" imageName:@"upomp_button_keyboard3" selectedImageName:@"upomp_button_keyboard3_highlighted" item:item1];
    /*
    [item1 setTitle:@"OC" forState:UIControlStateNormal];
    [item1 setBackgroundImage:[UIImage imageNamed:@"upomp_button_keyboard3"] forState:UIControlStateNormal];
    [item1 setBackgroundImage:[UIImage imageNamed:@"upomp_button_keyboard3_highlighted"] forState:UIControlStateHighlighted];
    */
    item1.backgroundColor = [UIColor grayColor];

    UIButton * item2 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [item2 setTitle:@"Java" forState:UIControlStateNormal];
    
    [self setItemWithTitle:@"Java" imageName:@"upomp_button_keyboard3" selectedImageName:@"upomp_button_keyboard3_highlighted" item:item2];
    
    item2.backgroundColor = [UIColor purpleColor];
    
    
    UIButton * item3 = [UIButton buttonWithType:UIButtonTypeCustom];
//    [item3 setTitle:@"C" forState:UIControlStateNormal];
    
    [self setItemWithTitle:@"C" imageName:@"upomp_button_keyboard3" selectedImageName:@"upomp_button_keyboard3_highlighted" item:item3];
    
    item3.backgroundColor = [UIColor orangeColor];
    
    //然后传递给tabView
    tabView.items = @[item1,item2,item3];
    
    tabView.backgroundColor = [UIColor yellowColor];
    
}

//提取一个设置按钮内容的工具方法
- (void)setItemWithTitle:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName item:(UIButton *)item
{
    [item setTitle:title forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [item setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateHighlighted];
    
    //选中状态,必须配合UIView中的selected属性 设置为YES才能有效果
    [item setBackgroundImage:[UIImage imageNamed:selectedImageName] forState:UIControlStateSelected];

}

//ARC机制中需不需要关心内存问题?
//必须关心,如果有大量的对象驻留在内存中一样会导致程序性能的下降
//ios MRC/ARC 都是即时性机制/java垃圾回收机制(惰性)
//如果消耗内存过多达到了ios系统分配限额,会给我们的程序主动的发送内存警告,通知我们去进行处理(消耗到40M,110M主动杀掉你的应用)
//一旦收到系统内存警告,那么立即释放掉没有正在使用的对象(视图)


- (void)tabViewItemDidSelected:(GPTabView *)tabView item:(UIButton *)item index:(NSInteger)index
{
    
    //根据index,确定点击哪一个具体的按钮
    if(index == 0)
    {
        [self.view bringSubviewToFront:self.ocListView];
        //记录当前用户正在查看的
        self.currentShowView = self.ocListView;
    }
    else if (index == 1)
    {

        GPJavaListView * tmp = self.javaListView;
        [self.view bringSubviewToFront:tmp];

        //记录当前用户正在查看的视图
        self.currentShowView = self.javaListView;
        
    }
    else if (index == 2)
    {
        
        [self.view bringSubviewToFront:self.cListView];
        self.currentShowView = self.cListView;
    }
    
     [self.view bringSubviewToFront:tabView];
    
}//end method

//由系统自动调用,不需要程序员关心他是何时调用的
//我们只需要在这个方法被调用的时候,去进行相应的处理就可以
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
    
    NSLog(@"%@",NSStringFromSelector(_cmd));
    //1.一旦接收到消息,立即处理
    //如何处理?
    //把当前用户,没有使用的视图全部进行卸载(清除出内存)
    if(self.currentShowView != self.ocListView)
    {
        [self.ocListView removeFromSuperview];
        self.ocListView = nil;
    }
    if(self.currentShowView != self.javaListView)
    {
        [self.javaListView removeFromSuperview];
    }
    if(self.currentShowView != self.cListView)
    {
        [self.cListView removeFromSuperview];
    }
    
    
}//end method

@end
