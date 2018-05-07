//
//  GPMessage.h
//  01-即时通讯布局
//
//  Created by 哲 肖 on 16/2/22.
//  Copyright (c) 2016年 百度移动事业部. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

enum GPMessageType
{
    GPMessageTypeMe,
    GPMessageTypeMeOther
};

typedef enum GPMessageType GPMessageType;


@interface GPMessage : NSObject

@property (nonatomic, copy)NSString * text;
@property (nonatomic, copy)NSString * time;

@property (nonatomic, assign)GPMessageType type;

@property (nonatomic, assign)CGFloat rowHeight;
@property (nonatomic, assign)CGRect timeFrame;
@property (nonatomic, assign)CGRect textFrame;
@property (nonatomic, assign)CGRect headerFrame;

+(id)messageWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;

@end
