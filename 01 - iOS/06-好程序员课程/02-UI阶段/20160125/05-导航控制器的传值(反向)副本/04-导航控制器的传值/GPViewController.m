//
//  GPViewController.m
//  04-导航控制器的传值
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPViewController.h"
#import "GPTwoViewController.h"

//一个类发生改变,间接影响到其他的类也不能够正常的使用
//这是一种强耦合的表现,面向对象应该尽可能降低类与类之间的耦合度

@interface GPViewController ()<GPTwoViewControllerDelegate>

@end

@implementation GPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    //1.第一种通过NSUserDefault 可以完成
    
    //2.
    GPTwoViewController * twoViewController = [[GPTwoViewController alloc] init];
    
    
    [twoViewController target:self action:@selector(titleNameBack:)];
    
//    twoViewController.delegate = self;
//    twoViewController.oneViewController = self;
    

    /*
    //为了防止代码块中,出现循环强引用,那么在使用self相关的对象进行设置的时候,要先声明一个临时的weak变量,在代码块中进行应用
    __weak GPViewController * oneViewController = self;
    
    [twoViewController setTwoViewControllerBackItemTouchBlock:^(GPTwoViewController * tmpViewController, NSString * titleName) {
        
//        self.navigationItem.title = titleName;
        oneViewController.navigationItem.title = titleName;
        
    }];
    */
    
    
    [self.navigationController pushViewController:twoViewController animated:YES];
}

- (void)titleNameBack:(NSString *)nameTitle
{
    self.navigationItem.title = nameTitle;
}

- (void)twoViewControllerBackItemTouch:(GPTwoViewController *)twoViewController nameTitle:(NSString *)nameTitle
{
    self.navigationItem.title = nameTitle;
}

@end
