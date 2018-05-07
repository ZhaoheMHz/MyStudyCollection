//
//  AttachmentView.h
//  UIDynamic_Demo
//
//  Created by baoxu on 16/3/11.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import "DynamicView.h"

@interface AttachmentView : DynamicView
{
    //拖布把手
    UIImageView *_anchorImage;
    //拖布杆头
    UIImageView *_offsetImage;
    
}
@property (strong, nonatomic) UIAttachmentBehavior *attchment;
@end
