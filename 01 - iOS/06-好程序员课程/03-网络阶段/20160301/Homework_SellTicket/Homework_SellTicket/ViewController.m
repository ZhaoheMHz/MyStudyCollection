//
//  ViewController.m
//  Homework_SellTicket
//
//  Created by baoxu on 15/11/19.
//  Copyright © 2015年 BaoXu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (assign, nonatomic) int ticketCount;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    self.ticketCount = 100;
    self.ticketCount = 2;
    
    //不出键盘
    self.textView.editable = NO;

    
}
- (IBAction)sellTicketClicked:(id)sender {
    
    for (int i=1; i<4; i++) {
        NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(sellTicket) object:nil];
        thread.name = [NSString stringWithFormat:@"%d号售票员",i];
        [thread start];
    }
    
}

-(void)sellTicket{
    // 只要有票所有线程进入都可以循环卖票
    while (self.ticketCount > 0) {
        // 加互斥锁，在共享资源的“读”“写”范围添加互斥锁
        // *** 要让锁的范围尽可能小！
        // 资源抢夺做简单的做法就是使用互斥锁@synchronized
        // 使用互斥锁，会变慢，互斥锁的代价十分高昂！
//        @synchronized(<#token#>) {
//            <#statements#>
//        }
        @synchronized(self) {
            //这里也要判断一下，比如只有两张票
            if (self.ticketCount == 0) {
                break;
            }
            
            --self.ticketCount;
            
            NSString *msg = [NSString stringWithFormat:@"%@ 卖出一张票，剩余票数 %d",[NSThread currentThread].name, self.ticketCount];
            
            [self performSelectorOnMainThread:@selector(updateUI:) withObject:msg waitUntilDone:NO];
            
            NSLog(@"ticketCount:%d",self.ticketCount);
        }
        //-----------------------------------------
        // 模拟休眠，跟资源抢夺无关，不用放在锁里
        if ([[NSThread currentThread].name isEqualToString:@"1号售票员"]) {
            [NSThread sleepForTimeInterval:1.0f];
        } else if ([[NSThread currentThread].name isEqualToString:@"2号售票员"]) {
            [NSThread sleepForTimeInterval:1.5f];
        } else {
            [NSThread sleepForTimeInterval:0.8f];
        }
    }
}

-(void)updateUI:(NSString *)str{
    self.textView.text = [NSString stringWithFormat:@"%@\n%@",self.textView.text,str];
    //自动滚屏
    [self.textView scrollRangeToVisible:NSMakeRange(self.textView.text.length, 1)];
    //由于重新设置了内容，导致每次都要从顶部跳到最后一行，界面很闪

    self.textView.layoutManager.allowsNonContiguousLayout = NO;
    
    //UITextView 中的 layoutManager(NSLayoutManager) 的是否非连续布局属性，默认是 YES，设置为 NO 后 UITextView 就不会再自己重置滑动了。
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
