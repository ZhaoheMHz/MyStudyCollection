//
//  SettingView.h
//  Day7-04内存管理下的代理设计模式
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlueSettingView.h"

@interface SettingView : NSObject
<BlueDelegate>

@property (nonatomic, strong) BlueSettingView *blueView;

- (void)jumpToBlueView;

@end



