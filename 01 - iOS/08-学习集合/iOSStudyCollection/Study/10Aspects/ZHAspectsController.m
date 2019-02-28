//
//  ZHAspectsController.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2019/2/27.
//  Copyright © 2019 赵赫. All rights reserved.
//

#import "ZHAspectsController.h"
#import <Aspects/Aspects.h>

@interface ZHAspectsController ()

@end

@implementation ZHAspectsController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /******************************** 可以直接hook类的方法，并可以选择hook切入的位置 ********************************/
    // 方法的前面
    [ZHAspectsController aspect_hookSelector:@selector(printSomething:) withOptions:AspectPositionBefore usingBlock:^(id<AspectInfo> aspectInfo, NSString *someWord){
        NSLog(@"hook了(before):打印了一些东西");
    } error:nil];
    [self printSomething:nil];
    
    // 代替方法
    [ZHAspectsController aspect_hookSelector:@selector(printSomething:) withOptions:AspectPositionInstead usingBlock:^(id<AspectInfo> aspectInfo, NSString *someWord){
        NSLog(@"hook了(instead):打印了一些东西");
    } error:nil];
    [self printSomething:nil];
    
    // 代替方法
    [ZHAspectsController aspect_hookSelector:@selector(printSomething:) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> aspectInfo, NSString *someWord){
        NSLog(@"hook了(after):打印了一些东西");
    } error:nil];
    [self printSomething:nil];
    
    /******************************** 也可以只hook某个实例的方法，而不影响其他实例的方法 ********************************/
    ZHAspectsController *vc1 = [[ZHAspectsController alloc] init];
    [vc1 aspect_hookSelector:@selector(IHaveADream) withOptions:AspectPositionAfter usingBlock:^(){
        NSLog(@"I want to be a doctor\n");
    } error:nil];
    [vc1 IHaveADream];
    
    ZHAspectsController *vc2 = [[ZHAspectsController alloc] init];
    [vc2 IHaveADream];
    
    /******************************** Hook后可以移除 ********************************/
    ZHAspectsController *vc3 = [[ZHAspectsController alloc] init];
    id<AspectToken> removeToken = [vc3 aspect_hookSelector:@selector(executeSomething) withOptions:AspectPositionAfter usingBlock:^(){
        NSLog(@"又执行了点啥\n");
    } error:nil];
    [vc3 executeSomething];
    [removeToken remove];
    [vc3 executeSomething];
}

#pragma mark - 一些额外的方法
- (void)printSomething:(NSString *)someWord {
    NSLog(@"打印了一些东西\n");
}

- (void)IHaveADream {
    NSLog(@"I have a dream");
}

- (void)executeSomething {
    NSLog(@"执行了点啥");
}

@end
