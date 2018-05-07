//
//  QFTabBarController.h
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTabBarController : UITabBarController
-(UIViewController *)addViewControllerWithName:(NSString *)name title:(NSString *)title imageFile:(NSString *)imageFile;
@end
