//
//  ZHRacNormalController.m
//  CacuDemoWithMasonryModel
//
//  Created by 赵赫 on 2018/3/2.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ZHRacNormalController.h"
#import "NSObject+Calculate.h"
#import "SecondViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>
#import <ReactiveObjC/NSObject+RACKVOWrapper.h>

@interface ZHRacNormalController ()

@property (nonatomic, readwrite, copy) NSString *kvoProperty;
@property (nonatomic, readwrite, assign) int kvoCount;
@property (nonatomic, readwrite, strong) RACDisposable *disposable;

@property (weak, nonatomic) IBOutlet UITextField *tf1;
@property (weak, nonatomic) IBOutlet UITextField *tf2;

@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation ZHRacNormalController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 链式语法
    //    float result = [NSObject makeCalculate:^(CalculateManager *make) {
    //        make.add(1).sub(1).add(10).multiple(2);
    //    }];
    
}

- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

// RACSubject用法
- (IBAction)btnTouch:(id)sender {
    SecondViewController *vc = [[SecondViewController alloc] init];
    
    /************* 简单用法 ************/
    // 创建信息
    vc.subject = [RACSubject subject];
    
    // 订阅信号，在信号sendNext的时候，相应
    [vc.subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"viewController：SecondViewController点击了按钮 %@", x);
    }];
    
    [self presentViewController:vc animated:YES completion:nil];
}


// RACSignal
- (IBAction)btnTouch2:(UIButton *)sender {
    /************* signal用法 ************/
    // 1.创建信号
    // block调用时刻：每当有订阅者订阅信号，就会调用block。
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"执行了didSubscribe");
        
//        [subscriber sendNext:@"sendNext"];
//        [subscriber sendCompleted];
        
        return [RACDisposable disposableWithBlock:^{
            // block调用时刻：当信号发送完成或者发送错误，就会自动执行这个block,取消订阅信号。
            // 执行完Block后，当前信号就不在被订阅了。
            NSLog(@"信号被销毁");
        }];
    }];
    
    // 这里subscribeNext后会直接执行上面createSignal后面的block，顺便订阅者会保存NextBlock，当sendNext的时候，下面的NextBlock就会执行
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"订阅了 %@", x);
    }];
    [signal subscribeError:^(NSError * _Nullable error) {
        
    }];
    [signal subscribeCompleted:^{
        
    }];
    
    /**
     这里我的理解，可以理解为，一个信号的创建和订阅是多个block的组合。
     1、创建信号会创建一个didSubscribe的block，不会执行，也就是冷信号
     2、当subscribeNext后，则信号被订阅，同时subscribeNext的nextblock被订阅者（signal内部管理）保存
     3、信号被订阅，就会执行didSubscribe这个block，信号就变成了热信号
     4、同时如果didSubscribe内部执行了sendNext，说明了发送了Next信号，因为之前订阅了Next信号，则subscribeNext的nextblock会执行
     5、同理我们还可以subscribeError、subscribeCompleted，当sendError、sendCompleted的时候，执行block
     */
    
    
    
    
    
    /************* button的点击事件 ************/
    // 这里用到两个RAC的宏，很好的解决了__weak和
    //    @weakify(self);
    //    [[sender rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
    //        @strongify(self);
    //        NSLog(@"点击了RACSignal按钮");
    //    }];

    
    
    
    
    /************* 订阅一个特定方法的信号 ************/
    //    [[self rac_signalForSelector:@selector(touchEvent1:)] subscribeNext:^(RACTuple * _Nullable x) {
    //        NSLog(@"点击事件1点击了");
    //    }];
    
    
    
    /************* 用于kvo ************/
//    @weakify(self);
//    // 监听后返回一个RACDisposable可用于取消订阅
//    [self.disposable dispose];  // 订阅前先取消上一次订阅
//    self.disposable = [self rac_observeKeyPath:@"kvoProperty" options:NSKeyValueObservingOptionInitial|NSKeyValueObservingOptionNew observer:self block:^(id value, NSDictionary *change, BOOL causedByDealloc, BOOL affectedOnlyLastComponent) {
//        @strongify(self);
//        NSLog(@"kvoProperty的内容：%@", self.kvoProperty);
//
//        // 点击多次后取消订阅
//        if (self.kvoCount >= 5) {
//            [self.disposable dispose];
//            self.kvoCount = 0;
//        }
//    }];
    
//    // 另一种写法
//    [[self rac_valuesForKeyPath:@"kvoProperty" observer:self] subscribeNext:^(id  _Nullable x) {
//
//    }];
    
//    // 另一种写法
//    [RACObserve(self, kvoProperty) subscribeNext:^(id  _Nullable x) {
//    }];
    
    
    
    
    /************* 用于通知 ************/
    //    [self.disposable dispose];
    //    // 订阅后也会生成RACDisposable
    //    self.disposable = [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"aNoti" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
    //        NSLog(@"通知内容：%@", x.object);
    //    }];

    
    
    
    
    /************* 用于输入框监听 ************/
//        @weakify(self);
//        [self.tf1.rac_textSignal subscribeNext:^(NSString * _Nullable x) {
//            @strongify(self);
//            NSLog(@"tf1输入框内容：%@", self.tf1.text);
//        }];
    
    
    
    /************* 用于输入框监听 ************/
    //    // 对信号进行过滤，filter会返回一个新的信号
    //    [[self.tf1.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
    //        return value.length < 5;
    //    }] subscribeNext:^(NSString * _Nullable x) {
    //        NSLog(@"tf1输入框内容：%@", self.tf1.text);
    //    }];
    
    
    
    
    /************* RAC()和RACObserve() ************/
//    // 这样kvoProperty产生变化的时候，kvoProperty就会自动变化了
//    RAC(self, tf1.text) = RACObserve(self, kvoProperty);
    
    
    
    
    /************* 登录按钮 ************/
//    RAC(_loginBtn, enabled) = [RACSignal combineLatest:@[_tf1.rac_textSignal, _tf2.rac_textSignal] reduce:^id (NSString *tf1Text, NSString *tf2Text) {
//        return @(tf1Text.length > 4 && tf1Text.length > 4);
//    }];
    
    
    
    
    /************* 定时器 ************/
//    [[RACSignal interval:1 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {
//        NSLog(@"%@", [NSDate date]);
//    }];
    
    
    
    
    /************* 两个任务同时 ************/
//    RACSignal *signal1 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"方法一执行完了");
//            [subscriber sendNext:nil];
//        });
//        return nil;
//    }];
//    RACSignal *signal2 = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            NSLog(@"方法二执行完了");
//            [subscriber sendNext:nil];
//        });
//        return nil;
//    }];
//    [self rac_liftSelector:@selector(updateUIS1:S2:) withSignals:signal1, signal2, nil];
}

// 点击事件1
- (IBAction)touchEvent1:(id)sender {
    /************* 用于kvo ************/
    //    self.kvoProperty = @"改变了！";
    //    self.kvoCount ++;
    
    
    
    //    /************* 用于通知 ************/
    //    // 发送一个通知
    //    [[NSNotificationCenter defaultCenter] postNotificationName:@"aNoti" object:@"发送了通知！"];
    
    
    
    /************* RAC()和RACObserve() ************/
//    self.kvoProperty = @"变化了";
}



#pragma mark - 辅助用函数
- (void)updateUIS1:(id)data1 S2:(id)data2 {
    NSLog(@"更新了UI");
}



@end
