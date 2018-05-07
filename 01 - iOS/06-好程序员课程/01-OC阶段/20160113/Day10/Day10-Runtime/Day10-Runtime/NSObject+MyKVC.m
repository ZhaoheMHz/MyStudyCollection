//
//  NSObject+MyKVC.m
//  Day10-Runtime
//
//  Created by ZhangChao on 16/1/13.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "NSObject+MyKVC.h"
#import <objc/message.h>

@implementation NSObject (MyKVC)

// [person my_setValue:@"xxx" forKey:@"name"];
- (void)my_setValue:(id)value forKey:(NSString *)key
{
    // self 基于动态运行时机制
    // 调用方法时，self才知道对象是谁
    // set + Name + : ===> setName:
//    if ([value isKindOfClass:[NSNumber class]]) {
//        NSInteger age = [value integerValue];
//    }
    
    NSString *methodString =
    [NSString stringWithFormat:@"set%@:", key.capitalizedString];
    
    SEL selector = NSSelectorFromString(methodString);
    
    objc_msgSend(self, selector, value);
}

- (void)my_setValuesAndKeysFromDict:(NSDictionary *)dict
{
    for (NSString *key in dict) {
        [self my_setValue:dict[key] forKey:key];
    }
}

@end








