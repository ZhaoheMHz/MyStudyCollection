//
//  Dog.h
//  Day2-03继承
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import "Animal.h"

@interface Dog : Animal
{
//    NSUInteger weight;
    NSUInteger _weight;
}

@property NSUInteger weight;

// 子类可以通过增加方法使其更加强大
- (void)bark;

@end








