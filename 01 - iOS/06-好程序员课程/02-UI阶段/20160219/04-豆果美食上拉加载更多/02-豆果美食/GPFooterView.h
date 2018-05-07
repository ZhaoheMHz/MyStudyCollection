//
//  GPFooterView.h
//  02-豆果美食
//
//  Created by 哲 肖 on 16/2/19.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <UIKit/UIKit.h>

enum GPFooterViewStatus {

    GPFooterViewStatusDragging,// 拖拽读取更多
    GPFooterViewStatusEndDragging,//松开读取更多
    GPFooterViewStatusLoading//加载更多
    
};

typedef enum GPFooterViewStatus GPFooterViewStatus;

@interface GPFooterView : UIView

@property (nonatomic, assign)GPFooterViewStatus status;

+(id)footerView;

@end
