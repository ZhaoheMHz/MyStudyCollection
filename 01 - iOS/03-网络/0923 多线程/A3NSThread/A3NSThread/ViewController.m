//
//  ViewController.m
//  A3NSThread
//
//  Created by 赵赤赤 on 15/9/23.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *pView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    _pView.progress = 0;
    
    // 开启一个子线程
    [self performSelectorInBackground:@selector(sonRun) withObject:nil];
}

- (void)sonRun {
    int i = 0;
    while (i++ < 5) {
        sleep(1);
        NSLog(@"son = %d", i);
        
        // 子线程中不允许操作UI(NSOperation和GCD也不允许)
        // 需要操作UI的话,得让主线程去完成
        // 最后一个bool表示是否等待主线程的方法执行完成
        [self performSelectorOnMainThread:@selector(runOnMain:) withObject:@(i/5.0f) waitUntilDone:YES];
    }
}

- (void)runOnMain:(NSNumber *)num {
    _pView.progress = num.floatValue;
}

@end
