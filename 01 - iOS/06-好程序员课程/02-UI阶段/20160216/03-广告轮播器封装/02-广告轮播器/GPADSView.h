//
//  GPADSView.h
//  02-广告轮播器
//
//  Created by 哲 肖 on 16/2/16.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPADSView;

@protocol GPADSViewDelegate <NSObject>

@optional
/**
 *  当点击了广告图片的时候,会主动调用的代理方法
 *
 *  @param adsView   GPADSView对象
 *  @param index     点击的第几张图片
 *  @param imageName 图片的名称
 */
- (void)adsViewDidSelected:(GPADSView *)adsView index:(NSInteger)index imageName:(NSString *)imageName;

@end


@interface GPADSView : UIView

//对外提供的属性接口
@property (nonatomic, copy)NSArray * imagesName;

@property (nonatomic, weak)id<GPADSViewDelegate> delegate;
@property (nonatomic, copy)void(^adsViewDidSelectedBlock)(GPADSView * adsView,NSInteger index,NSString * imageName);

+(id)adsViewWithFrame:(CGRect)frame;

@end
