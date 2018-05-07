//
//  GPAdsView.h
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GPADS.h"

@interface GPAdsView : UIView

/**
 *  要求保存的都是GPADS模型
 */
@property (nonatomic, copy)NSArray * adsArray;

+(id)adsViewWithFrame:(CGRect)frame;

@end
