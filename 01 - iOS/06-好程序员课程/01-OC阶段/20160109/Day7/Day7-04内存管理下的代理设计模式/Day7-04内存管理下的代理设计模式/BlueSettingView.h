//
//  BlueSettingView.h
//  Day7-04内存管理下的代理设计模式
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BlueDelegate <NSObject>

// 该情景通过代理设计模式中的协议，可以规范接口，核心调用逻辑的实现进行封装，可以避免外部造成的干扰
- (void)showOn;
- (void)showOff;

@end

// 1.变化点只有一个时，优先考虑目标动作机制
// 2.变化点较多时，优先考虑代理设计模式

// UI:UITableView 代理设计模式
// UI:事件驱动型控件 UIButton 目标动作机制
@interface BlueSettingView : NSObject

// 代理设计模式中，一般会把delegate 设置成弱引用weak
@property (nonatomic, weak) id<BlueDelegate> delegate;

// target-action
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL action;

- (void)addTarget:(id)target action:(SEL)action;

// 如果选择器中的方法是有BlueView来进行设置的，这里可以只添加target即可，不推荐把这样的类给别人使用
- (void)addTarget:(id)target;

- (void)turnOn;
- (void)turnOff;

@end





