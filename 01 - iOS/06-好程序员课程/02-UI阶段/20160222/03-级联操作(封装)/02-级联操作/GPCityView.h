//
//  GPCityView.h
//  02-级联操作
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPCityView;

@protocol GPCityViewDelegate <NSObject>

@optional
- (void)cityViewDidSelectedRow:(GPCityView *)cityView indexPath:(NSIndexPath *)indexPath objects:(NSArray *)objects;

@end

@interface GPCityView : UITableView

@property (nonatomic, weak)id<GPCityViewDelegate> mydelegate;
@property (nonatomic, copy)NSArray * cityArray;

+(id)cityViewWithFrame:(CGRect)rect;

@end
