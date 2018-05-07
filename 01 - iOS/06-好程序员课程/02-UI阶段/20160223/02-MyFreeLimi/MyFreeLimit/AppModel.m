//
//  AppModel.m
//  MyFreeLimit
//
//  Created by mac on 14-1-3.
//  Copyright (c) 2014年 张健. All rights reserved.
//

#import "AppModel.h"

@implementation PhotoModel

@end

@implementation AppModel

-(void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    self.desc = value;
}



@end
