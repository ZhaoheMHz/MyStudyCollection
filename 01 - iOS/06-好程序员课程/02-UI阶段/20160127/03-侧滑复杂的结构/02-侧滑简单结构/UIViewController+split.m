//
//  UIViewController+split.m
//  02-侧滑简单结构
//
//  Created by 哲 肖 on 16/1/27.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "UIViewController+split.h"
#import <objc/runtime.h>

@interface UIViewController ()

@property (nonatomic, assign)BOOL expand;

@end

@implementation UIViewController (split)

static char * key;

- (void)setExpand:(BOOL)expand
{
    //<#id object#> : 传进来的变量,要与那个对象进行关联
    //<#const void *key#>: 唯一标识,方便我们在去值的时候应用
    //id value   我们要与当前类(对象)进行关联的具体值
    //<#objc_AssociationPolicy policy#> 内存管理策略
    objc_setAssociatedObject(self, &key, @(expand), OBJC_ASSOCIATION_ASSIGN);
}

- (BOOL)expand
{
    return [objc_getAssociatedObject(self, &key) boolValue];
}

- (void)splitView
{
    //1.展开
    if((self.expand = !self.expand))
    {
        self.view.transform = CGAffineTransformMakeTranslation(300, 0);
    }
    else
    {
        self.view.transform = CGAffineTransformIdentity;
    }
    //2.归位
}

@end
