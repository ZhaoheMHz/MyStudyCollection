//
//  ZHSemaphoreTool.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/5/17.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHSemaphoreTool.h"

@interface ZHSemaphoreTool()

@property (nonatomic, strong) dispatch_semaphore_t sema;

@end

@implementation ZHSemaphoreTool

+ (instancetype)creatSemaphore:(long)semephoreCount {
    if ([NSThread isMainThread]) {
        return nil;
    } else {
        ZHSemaphoreTool *tool = [[ZHSemaphoreTool alloc] init];
        tool.sema = dispatch_semaphore_create(semephoreCount);
        return tool;
    }
}

- (void)signal {
    dispatch_semaphore_signal(self.sema);
}

- (void)wait {
    dispatch_semaphore_wait(self.sema, DISPATCH_TIME_FOREVER);
}

@end
