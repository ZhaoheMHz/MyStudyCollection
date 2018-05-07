//
//  main.m
//  Day7-04内存管理下的代理设计模式
//
//  Created by ZhangChao on 16/1/9.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SettingView.h"
#import "BlueSettingView.h"
#import "Car.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
//        SettingView *settingView =
//        [[SettingView alloc] init];
        
        BlueSettingView *blueView =
        [[BlueSettingView alloc] init];
        
//        // 跳转到蓝牙界面
//        [settingView jumpToBlueView];
//        
////        blueView.delegate = settingView;
//        [settingView.blueView turnOn];
//        [settingView.blueView turnOff];
        
        Car *car = [[Car alloc] init];
        [blueView addTarget:car action:@selector(showOn)];
        [blueView turnOn];
    }
    
    return 0;
}





