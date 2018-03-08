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

@property (weak, nonatomic) IBOutlet UIButton *commandBtn;

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





#pragma mark - RACSubject
// RACSubject用法
- (IBAction)btnTouch:(id)sender {
    /********************************* RACSubject的代理用法 *********************************/
    SecondViewController *vc = [[SecondViewController alloc] init];
    // 创建信息
    vc.subject = [RACSubject subject];

    // 订阅信号，在信号sendNext的时候，相应
    [vc.subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"viewController：SecondViewController点击了按钮 %@", x);
    }];

    [self presentViewController:vc animated:YES completion:nil];
    
    
    
    
    
    
    
    /********************************* RACSubject的理解 *********************************/
    /** RACSubject */
//    // 创建RACSubject的时候，没有didSubscribe的block
//    RACSubject *racSubject = [RACSubject subject];
//
//    // 调用subscribeNext订阅信号的next事件，则RACSubject会保存所有订阅者
//    // 当sendNext的时候，遍历订阅者，执行所有的nextBlock
//    [racSubject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"订阅1 %@", x);
//    }];
//    [racSubject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"订阅2 %@", x);
//    }];
//    [racSubject sendNext:@"发送信号1"];
//    [racSubject sendNext:@"发送信号2"];
    
    
    
    
    /** RACReplaySubject */
//    RACReplaySubject *replaySubject = [RACReplaySubject subject];
//    [replaySubject sendNext:@"发送信号1"];
//    [replaySubject sendNext:@"发送信号2"];
//    [replaySubject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"订阅1 %@", x);
//    }];
//    [replaySubject subscribeNext:^(id  _Nullable x) {
//        NSLog(@"订阅2 %@", x);
//    }];
//    [replaySubject sendNext:@"发送信号3"];
//    // 订阅前的next信号都会在订阅的时候接受到，订阅后的send信号，跟racSubject的效果是一样的
}





#pragma mark - RACSignal
- (IBAction)btnTouch2:(UIButton *)sender {
    /********************************* signal用法 *********************************/
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
    RACDisposable *d = [signal subscribeNext:^(id  _Nullable x) {
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
    
    
    
    
    
    /**
     RACSignal使用步骤：
    // 1.创建信号 + (RACSignal *)createSignal:(RACDisposable * (^)(id<RACSubscriber> subscriber))didSubscribe
    // 2.订阅信号,才会激活信号. - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
    // 3.发送信号 - (void)sendNext:(id)value
    
    
    // RACSignal底层实现：
    // 1.创建信号，首先把didSubscribe保存到信号中，还不会触发。
    // 2.当信号被订阅，也就是调用signal的subscribeNext:nextBlock
    // 2.2 subscribeNext内部会创建订阅者subscriber，并且把nextBlock保存到subscriber中。
    // 2.1 subscribeNext内部会调用siganl的didSubscribe
    // 3.siganl的didSubscribe中调用[subscriber sendNext:@1];
    // 3.1 sendNext底层其实就是执行subscriber的nextBlock
    
    作者：袁峥
    链接：https://www.jianshu.com/p/87ef6720a096
    來源：简书
    著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
     */
    
    
    
    
    
    
    
    
    
    /********************************* button的点击事件 *********************************/
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

- (void)updateUIS1:(id)data1 S2:(id)data2 {
    NSLog(@"更新了UI");
}




#pragma mark - RACSequence和RACTuple
- (IBAction)button3:(id)sender {
    /** 数组 */
    NSArray *nums = @[@"1", @"2", @"3", @"4"];
    // 数组转换为rac_sequence，获取序列的信号，订阅，则会遍历序列
    [nums.rac_sequence.signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    
    
    
    /** 字典 */
    NSDictionary *dict = @{@"name":@"xmg",@"age":@18};
    [dict.rac_sequence.signal subscribeNext:^(RACTuple *x) {
        // 解包元组，会把元组的值，按顺序给参数里面的变量赋值
        RACTupleUnpack(NSString *key, NSString *value) = x;
        NSLog(@"key:%@, value:%@", key, value);
    }];
}



#pragma mark - RACCommand
- (IBAction)racCommand:(id)sender {
//    // 一、RACCommand使用步骤:
//    // 1.创建命令 initWithSignalBlock:(RACSignal * (^)(id input))signalBlock
//    // 2.在signalBlock中，创建RACSignal，并且作为signalBlock的返回值
//    // 3.执行命令 - (RACSignal *)execute:(id)input
//
//    // 二、RACCommand使用注意:
//    // 1.signalBlock必须要返回一个信号，不能传nil.
//    // 2.如果不想要传递信号，直接创建空的信号[RACSignal empty];
//    // 3.RACCommand中信号如果数据传递完，必须调用[subscriber sendCompleted]，这时命令才会执行完毕，否则永远处于执行中。
//    // 4.RACCommand需要被强引用，否则接收不到RACCommand中的信号，因此RACCommand中的信号是延迟发送的。
//
//    // 三、RACCommand设计思想：内部signalBlock为什么要返回一个信号，这个信号有什么用。
//    // 1.在RAC开发中，通常会把网络请求封装到RACCommand，直接执行某个RACCommand就能发送请求。
//    // 2.当RACCommand内部请求到数据的时候，需要把请求的数据传递给外界，这时候就需要通过signalBlock返回的信号传递了。
//
//    // 四、如何拿到RACCommand中返回信号发出的数据。
//    // 1.RACCommand有个执行信号源executionSignals，这个是signal of signals(信号的信号),意思是信号发出的数据是信号，不是普通的类型。
//    // 2.订阅executionSignals就能拿到RACCommand中返回的信号，然后订阅signalBlock返回的信号，就能获取发出的值。
//
//    // 五、监听当前命令是否正在执行executing
//
//
//    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
//
//        NSLog(@"执行命令");
//
//        // 必须返回信号，可以直接返回空信号
////        return [RACSignal empty];
//
//        if (arc4random()%2 == 0) {
//            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//
//                // 返回的RACSignal用于传递command执行完后的传递数据（比如网络请求等）
//                [subscriber sendNext:@"请求到的数据1"];
//
//                // 这里一定要sendCompleted，否则command会一直处于执行状态
//                [subscriber sendCompleted];
//
//                return nil;
//            }];
//        } else {
//            return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
//                [subscriber sendNext:@"请求到的数据2"];
//                [subscriber sendCompleted];
//                return nil;
//            }];
//        }
//    }];
//
//    self.commandBtn.rac_command = command;
//
//    /**
//     这里executionSignals是上面command中的return信号的集合信号
//     订阅这个信号，则executionSignals的订阅者就有了一个nextBlock。
//     当按钮点击下去的时候，首先执行创建command时定义的signalBlock
//     然后在signalBlock return siganl的时候，
//     executionSignals的订阅者的nextBlock就会执行，executionSignals的sendNext会返回一个signal给nextBlock，假设叫innerSignal
//     innerSignal在nextBlock中被订阅，则会拿到innerSignal发送的next信号传过来的数据
//     */
////    [self.commandBtn.rac_command.executionSignals subscribeNext:^(id  _Nullable x) {
////        [x subscribeNext:^(id  _Nullable x) {
////            NSLog(@"所有信号:%@", x);
////        }];
////    }];
////
//    // 也可以只订阅最新return的signal
//    [self.commandBtn.rac_command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
//        NSLog(@"最新信号:%@", x);
//    }];
//
//    // executing这个信号，监听的是command是否在执行，会在command的signalBlock执行之前、执行中、执行完sendNext，则下面的信号需要过滤调执行前的（这里可以去掉skip:1看看执行出来的效果）
//    [[self.commandBtn.rac_command.executing skip:1] subscribeNext:^(NSNumber * _Nullable x) {
//        NSLog(@"按钮的点击状态:%@", x);
//    }];
//
//    // 也可以不通过按钮点击，主动执行command
////    [command execute:@1]; // 这个execute传入的参数，就是command初始化signalBlock获取到的input参数
    
    
    
    
    
    
    /********************** 来自另一篇文章的Demo **********************/
//    https://draveness.me/raccommand
    RACCommand *command = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
        return [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
            
            for (int i=0; i<[input integerValue]; i++) {
                [subscriber sendNext:@(i)];
            }
            [subscriber sendCompleted];
            
            return nil;
        }];
    }];
    
    [command.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@", x);
    }];
    
    // 执行如下三条代码，只会返回0，只会打印0，因为command不支持并发执行，所以如果想执行之后的代码，可以延后执行
    [command execute:@1];
    [command execute:@2];
    [command execute:@3];
    
    [command execute:@1];
    [RACScheduler.mainThreadScheduler afterDelay:0.1 schedule:^{
        [command execute:@2];
    }];
    [RACScheduler.mainThreadScheduler afterDelay:0.2 schedule:^{
        [command execute:@3];
    }];
}




@end
