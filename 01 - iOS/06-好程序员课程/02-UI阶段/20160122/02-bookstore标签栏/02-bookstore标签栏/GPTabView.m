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
    
}//end method

- (void)btnTouch:(UIButton *)btn
{
    [self.delegate tabViewItemDidSelected:self item:btn index:btn.tag];
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
