//
//  main.m
//  01-第一个ios程序
//
//  Created by 哲 肖 on 16/1/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPAppDelegate.h"

int main(int argc, char * argv[]) {
    
    //1.这个main函数就是ios程序运行的入口,最先运行
    //2.创建一个UIApplication对象,UIApplication代表就是一个独立的应用程序,每一个程序只有唯一的一个UIApplication对象,他是完全单利的
    //3.通知开发者,程序是否运行正常,如果一切正常,那么我们程序员就可以进行逻辑代码的编写了
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([GPAppDelegate class]));
    }
    
    
}
