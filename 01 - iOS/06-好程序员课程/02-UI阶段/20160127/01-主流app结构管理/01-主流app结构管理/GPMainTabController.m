//
//  GPMainTabController.m
//  01-主流app结构管理
//
//  Created by 哲 肖 on 16/1/27.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPMainTabController.h"
#import "GPCookbookController.h"
#import "GPEventsController.h"
#import "GPMallController.h"
#import "GPMineController.h"
#import "GPLoginController.h"

@interface GPMainTabController ()<UITabBarControllerDelegate>

@end

@implementation GPMainTabController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //1.添加需要管理的子视图控制器
    
    //1.食谱控制器
    GPCookbookController * cookBookController = [[GPCookbookController alloc] init];
    [self setControllerItem:cookBookController title:@"食谱" normalImage:@"tab_icon_cookbook_normal" selectedImage:@"tab_icon_cookbook_hl"];
    //2.圈圈控制器
    GPEventsController * eventsController = [[GPEventsController alloc] init];
    [self setControllerItem:eventsController title:@"圈圈" normalImage:@"tab_icon_events_normal" selectedImage:@"tab_icon_events_hl"];
    
    //3.优食惠控制器
    GPMallController * mallController = [[GPMallController alloc] init];
    [self setControllerItem:mallController title:@"优食惠" normalImage:@"tab_icon_mall_normal" selectedImage:@"tab_icon_mall_hl"];
    
    //4.我的控制器
    GPMineController * mineController = [[GPMineController alloc] init];
    [self setControllerItem:mineController title:@"我的" normalImage:@"tab_icon_mine_normal" selectedImage:@"tab_icon_mine_hl"];
    
    //标记一下tabBarItem的tag值
    mineController.tabBarItem.tag = 3;
    
    //自己来实现自己的代理方法
    self.delegate = self;
    
}

#pragma mark UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    
    /*
    NSLog(@"%@",NSStringFromClass([viewController class]));
    NSLog(@"%ld",viewController.tabBarItem.tag);
    */
    if(viewController.tabBarItem.tag == 3)
    {
        //1.判断用户是否已经登录
        NSUserDefaults * udf = [NSUserDefaults standardUserDefaults];
        NSString * name = [udf objectForKey:@"name"];
        //如果登录
        if(name != nil && name.length > 6)
        {
            //登录成功
        }
        else
        {
            //如果没登陆
            
            //弹出一个登录页面
            
            GPLoginController * loginController = [[GPLoginController alloc] init];
            
            UINavigationController * navLoginController = [[UINavigationController alloc] initWithRootViewController:loginController];
            
            [self presentViewController:navLoginController animated:YES completion:nil];
            
            //只要跳转到登录页面
            return NO;
            
        }
        
        
    }//end if
    
    return YES;
}

- (void)setControllerItem:(UIViewController *)viewController title:(NSString *)title normalImage:(NSString *)normalImage selectedImage:(NSString *)selectedImage
{
    //设置标题相关
    viewController.navigationItem.title = title;
//    viewController.tabBarItem.title = title;

    //设置标题图片
    viewController.tabBarItem.image = [[UIImage imageNamed:normalImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    viewController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //调整图片的位置
    viewController.tabBarItem.imageInsets = UIEdgeInsetsMake(5, 0, -5, 0);
    
    //添加导航控制器
    UINavigationController * navController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    
    //交给标签控制器管理
    //addChildViewController 把一个控制器交给标签控制器管理
    [self addChildViewController:navController];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
