//
//  DetailViewController.h
//  MyFreeLimit
//
//  Created by mac on 14-1-5.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "RootViewController.h"

#import "AppModel.h"

#import "UMSocial.h"

#import "MMProgressHUD.h"


@interface DetailViewController : RootViewController <UIActionSheetDelegate,UMSocialUIDelegate>
@property (nonatomic, retain) AppModel *model;
@end
