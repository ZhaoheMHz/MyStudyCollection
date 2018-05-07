//
//  ZHLoginViewModel.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/12.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHLoginViewModel.h"

@implementation ZHLoginViewModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initBind];
    }
    return self;
}

- (void)initBind {
    // 按钮点击状态
    _enableLoginBtnSignal = [RACSignal combineLatest:@[RACObserve(self.account, account), RACObserve(self.account, pwd)] reduce:^id (NSString *account, NSString *pwd){
        return @(account.length && pwd.length);
    }];
    
    // 登录command
    _loginCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [subscriber sendNext:@"获取了登录数据"];
                [subscriber sendCompleted];     // 一定要sendCompleted，否则command的executing一直是执行中
            });
            return nil;
        }];
    }];
}

- (ZHAccountModel *)account {
    if (_account == nil) {
        _account = [[ZHAccountModel alloc] init];
    }
    
    return _account;
}

@end
