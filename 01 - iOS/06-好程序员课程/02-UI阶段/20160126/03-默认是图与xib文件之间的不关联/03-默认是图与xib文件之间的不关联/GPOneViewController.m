//
//  GPOneViewController.m
//  03-默认是图与xib文件之间的不关联
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPOneViewController.h"
#import "GPTwoViewController.h"
#import "UIViewController+initl.h"

@interface GPOneViewController ()

@end

@implementation GPOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btnTouch
{
    
    //控制器的默认视图也是采用懒加载的方式,只有真正要用他的时候,他才会创建,或者是主动调用了控制器默认视图的get方法,才会使得主动创建出来
    //1.创建
    GPTwoViewController * twoController = [GPTwoViewController controller];//[[GPTwoViewController alloc] init];
//    twoController.view.backgroundColor = [UIColor yellowColor];
    //2.传值
    twoController.heroName = @"肖喆";
    
    //3.push
    [self.navigationController pushViewController:twoController animated:YES];
}
@end
