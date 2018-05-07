//
//  GPRootController.m
//  02-侧滑简单结构
//
//  Created by 哲 肖 on 16/1/27.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPRootController.h"

@interface GPRootController ()

@property(nonatomic, assign)BOOL expand;

@end

@implementation GPRootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"展开" style:UIBarButtonItemStylePlain target:self action:@selector(spliteView)];
    
}

- (void)spliteView
{
    //(_expand = !_expand) 每一次取值都是与上一次相反
    if((_expand = !_expand)){
    //1.移动当前控制器的时候
//    self.view.transform = CGAffineTransformMakeTranslation(200, 0);
    self.parentViewController.view.transform = CGAffineTransformMakeTranslation(200, 0);
    }
    else {
    //2.归位当前控制器的视图
    self.parentViewController.view.transform = CGAffineTransformIdentity;
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
