//
//  GPLoginView.m
//  02-xib应用
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import "GPLoginView.h"

@implementation GPLoginView

+ (id)loginView
{
    //1.获得xib文件
    NSArray * views = [[NSBundle mainBundle] loadNibNamed:@"GPLoginView" owner:nil options:nil];
    //2.返回对象
    return [views lastObject];
}

+ (id)loginViewWithInstallView:(UIView *)view
{
    GPLoginView * loginView = [self loginView];
    [view addSubview:loginView];
    return loginView;
}

+ (id)loginViewWithInstallView:(UIView *)view andLoginBlock:(void(^)(GPLoginView * loginView,NSString * name,NSString * pwd))loginBlock
{
    GPLoginView * loginView = [self loginViewWithInstallView:view];
    //保存block
    loginView.loginViewLoginButtonTouchBlock = loginBlock;
    
    return loginView;
}

//IBAction 代表的就是当前方法,是可以进行连线的

- (IBAction)loginButtonTouch:(UIButton *)sender {
    
    NSString * name = self.nameTextField.text;
    NSString * pwd = self.pwdTextFieldmy.text;
    
    //1.加密
    //2.发送给服务器
//    NSLog(@"name %@,pwd %@",name,pwd);
    
    [_delegate loginViewLoginButtonTouch:self name:name pwd:pwd];
    
    if(self.loginViewLoginButtonTouchBlock)
    {
        /*
        void (^tmpBlock)(GPLoginView * lognView,NSString *name,NSString * pwd) = self.loginViewLoginButtonTouchBlock;
        
        tmpBlock(self,name,pwd);
        */
        
        self.loginViewLoginButtonTouchBlock(self,name,pwd);
    }
    
}

@end
