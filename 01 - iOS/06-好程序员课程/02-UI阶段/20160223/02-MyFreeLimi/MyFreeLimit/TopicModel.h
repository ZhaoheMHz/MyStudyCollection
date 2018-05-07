//
//  TopicModel.h
//  MyFreeLimit
//
//  Created by mac on 14-4-10.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TopicModel : NSObject
@property (copy) NSString *title;
@property (copy) NSString *date;
@property (copy) NSString *img;
@property (copy) NSString *desc_img;
@property (copy) NSString *desc;
@property (retain) NSMutableArray *applications;
@end
