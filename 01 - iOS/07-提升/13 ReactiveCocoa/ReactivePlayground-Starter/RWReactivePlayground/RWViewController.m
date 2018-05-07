//
//  RWViewController.m
//  RWReactivePlayground
//
//  Created by Colin Eberhardt on 18/12/2013.
//  Copyright (c) 2013 Colin Eberhardt. All rights reserved.
//

#import "RWViewController.h"
#import "RWDummySignInService.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RWViewController ()

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIButton *signInButton;
@property (weak, nonatomic) IBOutlet UILabel *signInFailureText;

@property (strong, nonatomic) RWDummySignInService *signInService;

@end

@implementation RWViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.signInService = [RWDummySignInService new];
    
    // 隐藏提示框
    self.signInFailureText.hidden = YES;
    
    
    /*********************** tf的rac简单使用 *******************/
    /** tf文字改变的信号 */
//    [self.usernameTextField.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
    
    /** filter操作 */
//    [[self.usernameTextField.rac_textSignal filter:^BOOL(id value) {
//        NSString *text = value;
//        return text.length > 3;
//    }] subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
    
    /** 添加map操作,返回tf长度 */
//    [[[self.usernameTextField.rac_textSignal map:^id(NSString *value) {
//        return @(value.length);
//    }] filter:^BOOL(NSNumber *length) {
//        return length.integerValue > 3;
//    }] subscribeNext:^(id x) {
//        NSLog(@"%@", x);
//    }];
    
    
    
    
    /*********************** tf验证,登录验证的rac实现 *******************/
    // 创建验证用户名和密码的信号
    RACSignal *validUsernameSignal = [self.usernameTextField.rac_textSignal map:^id(NSString *text) {
        return @(text.length > 3);
    }];
    
    RACSignal *valicPasswordSignal = [self.passwordTextField.rac_textSignal map:^id(NSString *text) {
        return @(text.length > 3);
    }];
    
    // RAC的宏,两个参数
    // 1.设置属性值的对象
    // 2.要设置的属性
    // 接收信号中返回的颜色
    RAC(self.usernameTextField, backgroundColor) = [validUsernameSignal map:^id(NSNumber *usernameValid) {
        return [usernameValid boolValue]?[UIColor clearColor]:[UIColor yellowColor];
    }];
    
    RAC(self.passwordTextField, backgroundColor) = [valicPasswordSignal map:^id(NSNumber *passwordValid) {
        return [passwordValid boolValue]?[UIColor clearColor]:[UIColor yellowColor];
    }];
    
    
    
    
    
    /** 聚合两个信号,产生新的信号 */
    RACSignal *signUpActiveSignal = [RACSignal combineLatest:@[validUsernameSignal, valicPasswordSignal] reduce:^id(NSNumber *usernameValid, NSNumber *passwordValid){
        return @([usernameValid boolValue]&&[passwordValid boolValue]);
    }];
    
    /** 通过登录验证的信号,改变登录按钮的状态 */
    RAC(self.signInButton, enabled) = [signUpActiveSignal map:^id(NSNumber *signUpValid) {
        return @([signUpValid boolValue]?YES:NO);
    }];
    
    
    
    
    
    // rac的处理事件信号(flattenMap的block中,返回值是个signal,想要取出signal传递的block,使用mao,应该在next之后再next一次,flattenMap可以取出最外层)
    [[[self.signInButton rac_signalForControlEvents:UIControlEventTouchUpInside] flattenMap:^RACStream *(id value) {
        return [self signInSignal];
    }] subscribeNext:^(id x) {
        NSLog(@"Sign in result: %@", x);
    }];
}

- (RACSignal *)signInSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self.signInService signInWithUsername:self.usernameTextField.text password:self.passwordTextField.text complete:^(BOOL success) {
            [subscriber sendNext:@(success)];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}

@end
