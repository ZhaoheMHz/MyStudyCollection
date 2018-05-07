//
//  GPTabView.h
//  02-bookstore标签栏
//
//  Created by 哲 肖 on 16/1/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPTabView;

@protocol GPTabViewDelegate <NSObject>

@optional
- (void)tabViewItemDidSelected:(GPTabView *)tabView item:(UIButton *)item index:(NSInteger)index;

@end

@interface GPTabView : UIView

//告诉我要生成几个按钮,数组中保存的对象一定是UIButton
@property (nonatomic, copy)NSArray * items;

@property (nonatomic, weak)id<GPTabViewDelegate> delegate;

+(id)tabView;

@end
