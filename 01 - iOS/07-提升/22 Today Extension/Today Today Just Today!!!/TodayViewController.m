//
//  TodayViewController.m
//  Today Today Just Today!!!
//
//  Created by 赵赤赤 on 2016/9/21.
//  Copyright © 2016年 mhz. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "Masonry.h"
#import "SnakeViewController.h"

@interface TodayViewController () <NCWidgetProviding>

@property (nonatomic, strong) SnakeViewController *snakeVC;

@end

@implementation TodayViewController

- (void)viewWillAppear:(BOOL)animated {
    // 设置widget的状态为展开
    self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeExpanded;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.frame = CGRectMake(0, 0, 375, 300);
    
    // 添加点击打开App的功能
    [self addOpenAppAction];
    
    // 打开贪吃蛇
    [self addSnake];
}



#pragma mark - 打开App
- (void)addOpenAppAction {
    // 在背景上罩一个ImageView用于点击打开App
    UIImageView *backImageView = [[UIImageView alloc] init];
    backImageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGR = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(openApp)];
    [backImageView addGestureRecognizer:tapGR];
    [self.view addSubview:backImageView];
    [backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self openApp];
}

- (void)openApp {
    // 需要使用extensionContext来调用openURL方法，today extension和主应用间的通讯，主要靠url scheme来传递参数，其他数据不会共享
    NSURL *url = [NSURL URLWithString:@"todayDemo://?params=gotoSomeView"];
    [self.extensionContext openURL:url completionHandler:nil];
}




#pragma mark - 打开贪吃蛇
- (void)addSnake {
//    self.snakeVC = [[SnakeViewController alloc] init];
//    [self.view addSubview:self.snakeVC.view];
//    __weak typeof (self) _ws = self;
//    [self.snakeVC setFailBlock:^{
//        
//    }];
//    self.snakeVC.view.center = self.view.center;
}




#pragma mark - 展开、折叠的处理
- (void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize {
    if (activeDisplayMode == NCWidgetDisplayModeCompact) {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 110);
    } else {
        self.preferredContentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width, 300);
    }
}


- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    // 拿到主程序的NSUserDefault
    NSUserDefaults *userDefaults = [[NSUserDefaults alloc] initWithSuiteName:@"group.MyTodayGroup"];
    
    NSString *color = [userDefaults objectForKey:@"color"];
    if ([color isEqualToString:@"redColor"]) {
        self.view.backgroundColor = [UIColor redColor];
    }
    
    completionHandler(NCUpdateResultNewData);
}

@end
