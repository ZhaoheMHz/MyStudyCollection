//
//  MyView.m
//  01-UIVIew常用方法
//
//  Created by 哲 肖 on 16/1/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "MyView.h"

@implementation MyView

//这两个方法都是有由 系统自动调用
//调用了父子addsubview方法之后就会调用
//并且,会将新的父控件对象,作为参数,传递进来,那么在该方法中,就可以使用父亲对象的一些属性作为参考
- (void)willMoveToSuperview:(UIView *)newSuperview
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
    //设置自己的Frame与父亲组件完全重合
    self.frame = newSuperview.bounds;
    
}
//这个方法,在子视图,已经完成添加,显示之后会调用
- (void)didMoveToSuperview
{
    NSLog(@"%@",NSStringFromSelector(_cmd));
}


- (void)didAddSubview:(UIView *)subview
{
    //完成添加之后调用
}
- (void)willRemoveSubview:(UIView *)subview
{
    //执行了removeFromSuperView 即将删除子控件的时候调用,并且会把即将删除的子控件对象作为参数传递进来
}


@end
