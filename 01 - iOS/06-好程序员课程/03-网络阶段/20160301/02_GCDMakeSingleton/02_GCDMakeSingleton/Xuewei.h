//
//  Xuewei.h
//  02_GCDMakeSingleton
//
//  Created by baoxu on 16/3/1.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Xuewei : NSObject

/**
 * gets singleton object.
 * @return singleton
 */
+ (Xuewei*)sharedInstance;

@end
