//
//  ViewController.m
//  NSExceptionHandler
//
//  Created by 赵赫 on 2018/5/24.
//  Copyright © 2018年 赵赫. All rights reserved.
//

#import "ViewController.h"

typedef struct Test
{
    int a;
    int b;
} Test;

@interface ViewController ()

@property (nonatomic, assign) UIViewController *vc;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        @[][1];
        
        // SIGABRT
//        Test *pTest = {1,2};
//        free(pTest);//导致SIGABRT的错误，因为内存中根本就没有这个空间，哪来的free，就在栈中的对象而已
//        pTest->a = 5;
        
        //SIGBUS，内存地址未对齐
        //EXC_BAD_ACCESS(code=1,address=0x1000dba58)
        char *s = "hello world";
        *s = 'H';
    });
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSLog(@"点击了页面");
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        @[][1];
        NSLog(@"崩溃了");
    });
}

@end
