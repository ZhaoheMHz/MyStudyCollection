//
//  Banzhang.m
//  02_GCDMakeSingleton
//
//  Created by baoxu on 16/3/1.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "Banzhang.h"

//1.必须给一个全局的静态变量，要创建的单例类型的
static Banzhang *instance;

@implementation Banzhang

+(id)getBanzhang{
    if (instance == nil) {
        
        /**
         *  dispatch_once的作用正如其名，对于某个任务执行一次，并且只执行一次。有两个参数，第一个onceToken用来保证只执行一次，第二个参数block里的要执行的任务
            dispatch_once在多线程程序用被广泛应用，可靠简单
         */
        
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [super alloc];
            instance = [instance init];
            
//            if ([[super alloc]init]) {
//                
//            }
        });
        NSLog(@"%@",[super alloc]);
        NSLog(@"%@",self);
    }
    return instance;
}

//创建单例需要重写的方法，因为这个方法能够开辟新的内存空间（alloc会调用这个方法）
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}
//如果我们需要调用一个自定义的copy方法，就要重写copyWithZone方法，同时遵循NSCopying协议
-(id)copyWithZone:(NSZone *)zone{
    Banzhang *banzhang = [[Banzhang alloc]init];
    banzhang.name = self.name;
    return banzhang;
}
-(id)copy{
    Banzhang *banzhang = [[Banzhang alloc]init];
    banzhang.name = self.name;
    return banzhang;
}



@end
