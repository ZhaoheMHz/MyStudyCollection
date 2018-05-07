//
//  IconView.h
//  LimitFree
//
//  Created by yang on 20/12/13.
//  Copyright (c) 2013 北京千锋互联科技有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppModel.h"

@interface IconView : UIView {
    UIImageView *iconImage;
    UILabel *label;
    
    id _target;
    SEL _sel;
}

@property (nonatomic, retain) AppModel *model;

- (void)  addTarget:(id)target withAction:(SEL)sel;

@end
