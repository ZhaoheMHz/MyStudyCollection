//
//  OldWoman.m
//  Day5-02目标动作机制
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "OldWoman.h"

@implementation OldWoman

- (void)doWork
{
    [self lookAfterBaby];
    [self doHouseWork:@""];
}

- (void)lookAfterBaby
{
    NSLog(@"照看baby");
}

- (void)doHouseWork:(NSString *)work
{
    NSLog(@"%@", work);
}

@end




