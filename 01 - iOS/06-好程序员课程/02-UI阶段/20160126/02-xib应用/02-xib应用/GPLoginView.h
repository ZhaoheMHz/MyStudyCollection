//
//  GPLoginView.h
//  02-xib应用
//
//  Created by 哲 肖 on 16/1/26.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GPLoginView;

@protocol GPLoginViewDelegate <NSObject>

@optional
/**
 *  当用户点击了登录按钮之后,就会主动的调用loginViewLoginButtonTouch协议方法
 *
 *  @param loginView <#loginView description#>
 *  @param name      <#name description#>
 *  @param pwd       <#pwd description#>
 */
- (void)loginViewLoginButtonTouch:(GPLoginView *)loginView name:(NSString *)name pwd:(NSString *)pwd;

@end


/*
 
 代理,与block的选中
 1.如果我有很多个一些列方法,需要声明在协议中,那么就是用代理
 2.如果只有几个方法,就设置成block,简单快捷
 
 */


@interface GPLoginView : UIView

@property (nonatomic, weak) id<GPLoginViewDelegate> delegate;

@property (nonatomic, copy) void(^loginViewLoginButtonTouchBlock)(GPLoginView * loginView,NSString * name,NSString * pwd);

//IBOutlet 唯一作用就是,告诉编译器,该属性是可以连线的
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

@property (weak, nonatomic) IBOutlet UITextField *pwdTextFieldmy;

+ (id)loginView;

+ (id)loginViewWithInstallView:(UIView *)view;

+ (id)loginViewWithInstallView:(UIView *)view andLoginBlock:(void(^)(GPLoginView * loginView,NSString * name,NSString * pwd))loginBlock;

@end
