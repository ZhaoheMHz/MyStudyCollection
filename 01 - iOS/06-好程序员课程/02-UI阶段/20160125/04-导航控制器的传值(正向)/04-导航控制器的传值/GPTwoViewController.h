//
//  GPTwoViewController.h
//  04-导航控制器的传值
//
//  Created by 哲 肖 on 16/1/25.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPTwoViewController : UIViewController

//对外公开一个属性,接收外面传入的值
@property(nonatomic,copy)NSString * nameText;

//提供一些自定义的类方法,并且后面设置需要接收的参数
+(id)twoViewControllerWithNameTitle:(NSString *)nameTitle;

@end
