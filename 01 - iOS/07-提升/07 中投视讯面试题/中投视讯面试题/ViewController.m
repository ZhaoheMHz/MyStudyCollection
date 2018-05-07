//
//  ViewController.m
//  中投视讯面试题
//
//  Created by 赵赤赤 on 15/11/9.
//  Copyright © 2015年 mhz. All rights reserved.
//

#import "ViewController.h"
#import "DetailViewController.h"

typedef void (^myBlock)(void);

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(navPush) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [self testBlock];
    
    for (int i = 0; i <= 10000000; i++) {
            NSString *str = [NSString stringWithFormat:@"%d", i];
            NSLog(@"%@", str);
    }
}

- (void)testBlock {
    __block int val = 1024;
    myBlock blc = ^() {
        val += 100;
        NSLog(@"val = %d", val);
    };
    val = 2024;
    blc();
}

- (void)navPush {
    DetailViewController *dvc = [[DetailViewController alloc] init];
    [self.navigationController pushViewController:dvc animated:YES];
}

- (void)dealloc {
    NSLog(@"asdasdas");
}

@end
