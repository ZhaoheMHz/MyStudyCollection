//
//  UINavigationController+AOP.m
//  03-权限控制
//
//  Created by 哲 肖 on 16/2/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "UINavigationController+AOP.h"
#import "NSObject+AOP.h"
#import "GPLoginController.h"

@implementation UINavigationController (AOP)

+(void)load
{
    NSLog(@"UINavigationController load");
    [self aop_changeMethod:@selector(pushViewController:animated:) newMethod:@selector(aop_pushViewController:animated:)];
}

- (void)aop_pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //明确跳转到哪些页面的时候需要进行权限判断
    //json,xml(编程服务器网络获取)
    NSString * path = [[NSBundle mainBundle] pathForResource:@"LoginClassName.plist" ofType:nil];
    NSArray * loginClassName = [NSArray arrayWithContentsOfFile:path];
    
    for(NSString * tmpClassName in loginClassName)
    {
        NSString * className = NSStringFromClass([viewController class]);
        if([className isEqualToString:tmpClassName]){
            //1.获得用户名
            
            NSUserDefaults * duf = [NSUserDefaults standardUserDefaults];
            NSString * name = [duf objectForKey:@"name"];
            
            if(name == nil || name.length < 6)
            {
                //1.弹出登录页面
                GPLoginController * loginController = [[GPLoginController alloc] init];
                
                UINavigationController * navlogin = [[UINavigationController alloc] initWithRootViewController:loginController];
                
                [self presentViewController:navlogin animated:YES completion:nil];
                
                return ;
            }//end if (name == nil || name.length < 6)
            
        }//end if (NSString * tmpClassName in loginClassName)
        
    }//end for
    [self aop_pushViewController:viewController animated:animated];
    
}
@end
