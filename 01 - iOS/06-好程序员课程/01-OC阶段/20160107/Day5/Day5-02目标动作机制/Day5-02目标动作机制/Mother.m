//
//  Mother.m
//  Day5-02目标动作机制
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "Mother.h"

@implementation Mother

// 该方法用来设置 target 和 action
- (void)addTarget:(id)target action:(SEL)action
{
    // 把 target 和 action 声明成类的属性，是为了方便类中任意方法对目标动作机制的使用
    _target = target;
    _action = action;
    
    NSLog(@"\ntarget: %@\n action: %s",
          _target, _action);
}

- (void)goOutside
{
    NSLog(@"mother要外出了");
    
    // 可以用来指示类中未完成的功能逻辑
//    #warning 照看baby，未完成
    
//    SEL action = @selector(goOutside);
    // 为了防止调用一个没有实现的方法，这里需要先进行respondsToSelector：判断
    if ([_target respondsToSelector:_action]) {
        
        // 传参要使用withObject:
        [_target performSelector:_action withObject:@"做饭"];
    }
}



@end



