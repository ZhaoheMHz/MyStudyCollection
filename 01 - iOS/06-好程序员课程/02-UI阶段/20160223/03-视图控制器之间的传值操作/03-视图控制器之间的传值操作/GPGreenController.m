//
//  GPGreenController.m
//  03-视图控制器之间的传值操作
//
//  Created by 哲 肖 on 16/2/23.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPGreenController.h"
#import "GPRedController.h"

@interface GPGreenController ()

@end

@implementation GPGreenController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (IBAction)btnTouch:(id)sender {
    
    
    /*
    //1.获得控制器对象
    //2.调用push方法
    */
    
    //Segue 控制器与控制器之间的连线
    //Identifier 区别不同连线的标记
    //在指向跳转之前,还是会主动的调用prepareForSegue方法
    [self performSegueWithIdentifier:@"red" sender:nil];
    
}


// In a storyboard-based application, you will often want to do a little preparation before navigation
//从一个控制器,即将跳转到另外目标控制器的时候,会自动的调用
//怎么知道要跳转的目标控制器对象就是哪一个?
//segue 就是 连接控制器与控制器之间的那条线
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"red"])
    {
        /*
         UIViewController * viewController = segue.destinationViewController;
         NSLog(@"%@",NSStringFromClass([viewController class]));
         */
        //传递数据到目标控制器
        GPRedController * redController = segue.destinationViewController;
        redController.name = @"韩梅梅";
    }
    else
    {
        NSLog(@"跳转到blue控制器器");
    }
}


@end
