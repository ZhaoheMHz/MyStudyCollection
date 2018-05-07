//
//  Banzhang.h
//  02_GCDMakeSingleton
//
//  Created by baoxu on 16/3/1.
//  Copyright © 2016年 BaoXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Banzhang : NSObject<NSCopying>

@property (copy, nonatomic) NSString *name;

+(id)getBanzhang;

@end
