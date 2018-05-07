//
//  Person.h
//  A1fmdb
//
//  Created by 赵赤赤 on 15/9/21.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString *nameStr;
@property (nonatomic, copy) NSString *ageStr;
@property (nonatomic, strong) NSData *iconData;

@end
