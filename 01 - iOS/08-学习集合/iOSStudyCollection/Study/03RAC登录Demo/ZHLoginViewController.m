//
//  ZHLoginViewController.m
//  iOSStudyCollection
//
//  Created by 赵赫 on 2018/3/12.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHLoginViewController.h"
#import "ZHLoginViewModel.h"

@interface ZHLoginViewController ()

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *pwdField;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

// 持有ViewModel
@property (nonatomic, strong) ZHLoginViewModel *loginViewModel;

@end

@implementation ZHLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self bindViewModel];
}

// 绑定ViewModel
- (void)bindViewModel {
    // 绑定数据
    RAC(self.loginViewModel.account, account) = self.accountField.rac_textSignal;
    RAC(self.loginViewModel.account, pwd) = self.pwdField.rac_textSignal;
    
    // 登录按钮的点击
    RAC(self.loginBtn, enabled) = self.loginViewModel.enableLoginBtnSignal;
    
    // 按钮的command
    @weakify(self);
    [[self.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        @strongify(self);
        [self.loginViewModel.loginCommand execute:@1];
    }];
    // 订阅command执行完的信号
    [self.loginViewModel.loginCommand.executionSignals subscribeNext:^(RACSignal<id> * _Nullable x) {
        [x subscribeNext:^(id  _Nullable x) {
            NSLog(@"");
        }];
    }];
    // 在登录期间对页面进行操作
    [[self.loginViewModel.loginCommand.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
        if ([x isEqualToNumber:@1]) {
            NSLog(@"登录中");
        } else {
            NSLog(@"登录完成");
        }
    }];
}




#pragma mark - 懒加载
- (ZHLoginViewModel *)loginViewModel {
    if (_loginViewModel == nil) {
        _loginViewModel = [[ZHLoginViewModel alloc] init];
    }
    
    return _loginViewModel;
}



@end
