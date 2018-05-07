//
//  GPAppDelegate.m
//  01-第一个ios程序
//
//  Created by 哲 肖 on 16/1/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPAppDelegate.h"

@implementation GPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    
    //label上即将要显示的内容
    NSString * tmpString = @"abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz";
    
    //1.创建相关的子组件
    UILabel * label = [[UILabel alloc] init];
    //2.建立父子关系
    [self.window addSubview:label];
    //3.设置Frame
    //高度不确定
    CGFloat labelX = 0;
    CGFloat labelY = 100;
    CGFloat LabelW = 100;
    //如果想要动态的计算Label的显示高度,必须先知道label上将要显示的具体内容是什么
    //根据内容计算高度
    
    //CGRectMake
    //CGFLOAT_MAX 无限大
    CGSize size = CGSizeMake(LabelW, CGFLOAT_MAX); //宽度,高度
    
    //用来告诉系统,以哪种字体,那个字号作为计算高度的参考值
    //NSFontAttributeName 设置字体,字号
    NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:13]};
    
    //用来存储,计算完成之后的返回值使用的临时变量
    CGSize newSize;
    
    newSize = [tmpString boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size;
    
    CGFloat labelH = newSize.height;
    label.frame = CGRectMake(labelX, labelY, LabelW, labelH);
    label.text = tmpString;
    label.backgroundColor = [UIColor redColor];
    
    //Label动态折行
    //0 代表行数不确定,设置numberOfLines为0
    //设置font字体,与动态计算时参考的字体大小以及样式要统一
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:13];
    
    
    return YES;
}

- (void)labelTest1
{
    //1.创建window对象并且设置自动适应的屏幕尺寸
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    //    self.window.frame = CGRectMake(100, 0, 375, 667);
    //2.在屏幕上显示该window对象
    [self.window makeKeyAndVisible];
    //3.设置背景颜色
    self.window.backgroundColor = [UIColor whiteColor];
    
    //ios 界面开发中,苹果公司给我程序员提供了一个工具箱UIKit
    //UIKit中所有的基于页面开发的组件都是以UI开头的,要与Foundation框架区分开来
    
    //1.文本标签,是专门用来显示文字内容的组件
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 250, 80)];
    
    //2.一个组件,如果想要正确的显示在屏幕上,要具备什么条件
    // 1.一定要有一个正确的Frame值
    // 2.要显示在谁上面
    // 3.什么是父子关系?
    
    //addSubview 就是建立视图之间父子关系,那么子控件会随着父亲控件坐标变化而发生效果上的变化
    //子控件的坐标位置,是直接参考期父亲视图的左上角
    //如果一个组件想要正确的显示在屏幕上,一定要保证2点
    //1.具备正确的Frame值
    //2.与已经显示在屏幕上的某个视图,建立了父子关系
    [self.window addSubview:label];
    label.backgroundColor = [UIColor redColor];
    label.text = @"abcdefgabcdefgabcdefgabcdefgabcdefg,abcdefgabcdefgabcdefgabcdefgabcdefg,abcdefgabcdefgabcdefgabcdefgabcdefg,abcdefgabcdefgabcdefgabcdefgabcdefg,";
    
    //设置文字大小
    //    label.font = [UIFont systemFontOfSize:30];
    label.font = [UIFont fontWithName:@"Bodoni 72 Oldstyle" size:30];
    //根据UIFont中支持的字体,去进行设置才可以正确的应用
    NSArray * tmpArray = [UIFont familyNames];
    //    NSLog(@"%@",tmpArray);
    
    //textAlignment 设置文字显示的具体位置
    //常用的有3种
    //NSTextAlignmentLeft 居左显示
    //NSTextAlignmentCenter 居中显示
    //NSTextAlignmentRight 居右侧显示
    label.textAlignment = NSTextAlignmentCenter;
    //设置显示文字的行数
    //要设置固定的Label显示的具体行数,那么要保证Frame的高度能够够用
    label.numberOfLines = 2;
    
    
    //1.什么问题可以问?
    // 能够通过自己试验,推断出结论的问题,最好不要,除非有歧义?
    // 自己想不通,或者处理不了的问题,一定要经过推论之后再去与别人探讨
    //  1.我想要达到什么样的效果(没有达到,经常出现不确定)
    //  2.我尝试了用哪些方式方法,解决该问题但是就是解决不掉,或者解决的不如意
    

}

- (void)crateWindow
{
    NSLog(@"%@,%@",NSStringFromClass([self class]),NSStringFromSelector(_cmd));
    
    //想要程序运行起来能够正确的显示出来页面,就必须存在一个组要的Window对象
    //UIWindow就像相当于一个程序的画板,所有内容都是window上画出来的
    //1.创建window对象
    UIWindow * windown = [[UIWindow alloc] init];
    //2.要在程序主页面想显示出来window对象
    [windown makeKeyAndVisible];
    //3.设置背景颜色
    //UIColor 专门用来创建RGB染色的
    windown.backgroundColor = [UIColor whiteColor];
    //4.Frame(坐标系统)
    //一个视图,如果想要正确的显示下屏幕上,就必须有一个正确矩形框架
    //x,y,w,h
    
    //主要用来获得屏幕信息的,最主要的功能就是方便我们获得不同模拟器的屏幕尺寸
    UIScreen * screen = [UIScreen mainScreen];
    //screen.bounds,返回的就是相关屏幕的具体尺寸
    CGRect rect = screen.bounds;
    //    windown.frame = CGRectMake(0, 0, 375, 667);
    windown.frame = rect;
    
    //必须保存一个强指针,保证在整个应用程序的生命周期之内,都不能被释放掉
    self.window = windown;
    
    
    
    //ARC机制,MRC机制 内存管理相关
    //ARC,只要没有强直阵指向某一个对象,那么他将立即被系统回收
}

@end
