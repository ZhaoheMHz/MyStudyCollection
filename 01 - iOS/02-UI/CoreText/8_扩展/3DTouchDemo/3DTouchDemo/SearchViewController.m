//
//  SearchViewController.m
//  3DTouchDemo
//
//  Created by baoxu on 16/1/21.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2 - 100,
                                                               self.view.frame.size.height / 2 - 150,
                                                               200, 100)];
    label.text = @"搜索页";
    [label setTextColor:[UIColor redColor]];
    [label setTextAlignment:NSTextAlignmentCenter];
    [label setBackgroundColor:[UIColor grayColor]];
    [self.view addSubview:label];
}


// 实现这个方法之后， 3D Touch触发的情况下，向上滑动视图，下面会出现菜单
// 这个方法就是定义那些菜单的
-(NSArray<id<UIPreviewActionItem>> *)previewActionItems{
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"美女" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"搜索美女");
    }];
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"帅哥" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"搜索帅哥");
    }];
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"人妖" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"搜索人妖");
    }];
    return @[action1, action2, action3];
}

@end
