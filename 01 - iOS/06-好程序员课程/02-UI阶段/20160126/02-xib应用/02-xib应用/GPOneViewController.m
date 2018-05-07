//
//  GPOneViewController.m
//  02-xib应用
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPOneViewController.h"
#import "GPLoginView.h"

@interface GPOneViewController ()<GPLoginViewDelegate>

@end

@implementation GPOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    /*
    //1.获得视图对象
    GPLoginView * loginView = [GPLoginView loginView];
    //2.建立父子关系
    [self.view addSubview:loginView];
    //3.设置loginView代理对象
    loginView.delegate = self;
    */
    
    /*
    GPLoginView * loginView = [GPLoginView loginViewWithInstallView:self.view];
    loginView.delegate = self;
   */
    
//    GPLoginView * loginView = [GPLoginView loginViewWithInstallView:self.view];
    
//    loginView.loginViewLoginButtonTouchBlock = ^(GPLoginView * loginView,NSString * name,NSString * pwd)
//    {
//        
//        NSLog(@"block控制器获得 name =%@,pwd = %@",name,pwd);
//        
//    };
    
    /*
    //使用set方法,能够自动补全block的参数类型
    [loginView setLoginViewLoginButtonTouchBlock:^(GPLoginView * loginView, NSString * name, NSString * pwd) {
        
        NSLog(@"block控制器获得 name =%@,pwd = %@",name,pwd);
    }];
    */
    
    
    [GPLoginView loginViewWithInstallView:self.view andLoginBlock:^(GPLoginView *loginView, NSString *name, NSString *pwd) {
        
        NSLog(@"block控制器获得 name =%@,pwd = %@",name,pwd);
        
    }];
    
    
    
}

#pragma mark GPLoginViewDelegate
- (void)loginViewLoginButtonTouch:(GPLoginView *)loginView name:(NSString *)name pwd:(NSString *)pwd
{
    NSLog(@"控制器已经获得 name %@,pwd %@",name,pwd);
}


- (void)test
{
    /*
     for(UIView * subView  in loginView.subviews)
     {
     if([subView isKindOfClass:[UITextField class]])
     {
     UITextField * textField =   (UITextField *)subView;
     NSString * text =  textField.text;
     }
     }
     */
    
    /*
     //使用tag的方式,获得一个子控件,如果在一个子视图非常多的控件中,这么做会严重的影响性能
     UITextField * textField = [loginView viewWithTag:10];
     textField.text;
     */

}

- (void)test2
{
    
    //1.加载UIView
    //加载xib文件,GPLoginView.xib.xib
    
    //loadNibNamed 返回的是一个数组,因为在一个xib文件中,有可能有多个兄弟关系的根视图
    //建议在实际的开发中,一个xib文件只对应一个根视图
    /*
     NSArray * views = [[NSBundle mainBundle] loadNibNamed:@"GPLoginView" owner:nil options:nil];
     
     //由于GPLoginView.xib文件已经与一个具体的类GPLoginView进行类型绑定,所以返回来的视图类型就是GPLoginView类型的
     GPLoginView * loginView = [views lastObject];
     */
    //你要设计的这个功能谁最了解,就封装到谁的内部去
    
    GPLoginView * loginView = [GPLoginView loginView];
    
    
    NSString * name = loginView.nameTextField.text;
    
    NSLog(@"%@",name);
    
    
    //2.建立父子关系
    [self.view addSubview:loginView];
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
