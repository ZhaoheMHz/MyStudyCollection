//
//  GPTabView.m
//  02-bookstore标签栏
//
//  Created by 哲 肖 on 16/1/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPTabView.h"

@implementation GPTabView

+(id)tabView
{
    return [[self alloc] init];
}
//封装变化点
- (void)setItems:(NSArray *)items
{
    _items = items;
    
    //添加按钮,到自己内部管理
    for(int i = 0; i < items.count;i++)
    {
        UIButton * btn = self.items[i];
        //1.建立父子关系
        [self addSubview:btn];
        //2.设置每个btn的Frame值
        //不管有多少个UIbutton对象,都是平分整个屏幕的宽度
        //1.获得屏幕的宽度/总的数量 = 每一btn的宽度
        CGFloat btnW = self.frame.size.width / items.count;;
        CGFloat btnX = i  * btnW;
        CGFloat btnY = 0;
        CGFloat btnH = self.frame.size.height;
        btn.frame = CGRectMake(btnX, btnY, btnW, btnH);
        
        //3.添加监听事件
        [btn addTarget:self action:@selector(btnTouch:) forControlEvents:UIControlEventTouchUpInside];
        //使用tag值作为临时标记
        btn.tag = i;
        
    }//end for
    
    
    //默认点击一次第一个按钮,加载第一个页面的内容
    [self btnTouch:items[0]];
    
}//end method

- (void)btnTouch:(UIButton *)btn
{
    //如果当前点击的按钮,是选中状态,说明用户在重复点击一个按钮
    //为了让逻辑不在执行,判断一下
    if (btn.selected) {
        return;
    }
    //每次点击按钮的时候
    //1.先清除所有按钮的选中状态
    for(UIButton * button in self.items)
    {
        button.selected = NO;
        //如果想,用户触控一个按钮,没有任何交互反应,那么就要禁止UIButton与用户交互
        //让所有的btn都能够接收用户的触控事件
        button.userInteractionEnabled = YES;
    }
    //2.设置当前点击的按钮为选中状态
    btn.selected = YES;
    [self.delegate tabViewItemDidSelected:self item:btn index:btn.tag];
    //让当前选中的按钮,不能再继续接受用户的触控事件
    btn.userInteractionEnabled = NO;
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    //如果自己的坐标位置,与宽度等属性,每次创建出来都是比较固定的
    //那么就可以把设置Frame的代码,迁移到willMoveToSuperview中去设置
    CGFloat selfH = 49;
    CGFloat selfY = newSuperview.frame.size.height - selfH;
    self.frame = CGRectMake(0, selfY, newSuperview.frame.size.width, selfH);
}

@end
