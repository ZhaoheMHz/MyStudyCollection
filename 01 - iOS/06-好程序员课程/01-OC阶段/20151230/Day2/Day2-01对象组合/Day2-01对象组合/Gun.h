//
//  Gun.h
//  Day2-01对象组合
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Soldier;
// 类的前向引用，告诉Gun，有Soldier类的存在，但不会进行导入头文件，当出现类的相互包含时，就可以使用该方法

@interface Gun : NSObject
{
    NSString *_type;
    NSUInteger _bulletCount;
    // __weak 修饰后的指针是弱指针
    // 前面不添加任何修饰词，表示该对象指针是强指针(__strong)
    Soldier __weak *_holder;
}

- (void)setHolder:(Soldier *)holder;
- (void)setType:(NSString *)type;
- (void)setBulletCount:(NSUInteger)bulletCount;

- (NSString *)type;
- (NSUInteger)bulletCount;

- (void)fire;

@end



