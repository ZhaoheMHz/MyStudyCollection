//
//  GPContentView.h
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPContentView;

@protocol GPContentViewDelegate <NSObject>

@optional
/**
 *  当点击了某一行数据的时候,会触发该代理方法
 *
 *  @param contentView <#contentView description#>
 *  @param indexPath   <#indexPath description#>
 *  @param model       <#model description#>
 */
- (void)contentViewDidSelectedRow:(GPContentView *)contentView indexPath:(NSIndexPath *)indexPath model:(id)model;

@end

@interface GPContentView : UIView

@property (nonatomic, weak)id<GPContentViewDelegate> delegate;

@property (nonatomic, copy)NSArray * subjectArray;

@end
