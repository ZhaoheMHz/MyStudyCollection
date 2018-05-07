//
//  Boss.h
//  Day4-04代理设计模式
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

// 协议在代理模式中，一般会写在协议制定方所在的类（委托方）
// 代理设计模式：
// 1.类与类的通信是通过协议中的方法完成的
// 2.代理的双方：委托方、代理者
@protocol BossDelegate <NSObject>

// 代理需要实现的方法
- (void)buyWood;

@end

@interface Boss : NSObject

// 任意类型的对象都可以作为委托方的代理，只要遵守协议，实现协议中的方法即可
@property id<BossDelegate> delegate;

- (void)work;

@end









