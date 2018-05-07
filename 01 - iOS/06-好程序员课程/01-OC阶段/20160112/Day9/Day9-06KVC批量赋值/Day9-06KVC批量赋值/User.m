//
//  User.m
//  Day9-06KVC批量赋值
//
//  Created by ZhangChao on 16/1/12.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "User.h"

@implementation User

+ (void)test
{
    NSData *jsonData =
    [NSData dataWithContentsOfFile:@"/Users/chao/Desktop/iOS-BJ1507/OC阶段/Day9/JSON&XML/jsonUserList.json"];
    
    NSDictionary *dict =
    [NSJSONSerialization
     JSONObjectWithData:jsonData
     options:NSJSONReadingMutableContainers
     error:nil];
    
    NSArray *users = dict[@"users"];
    NSDictionary *userDict = users.firstObject;
    NSLog(@"%@", userDict);
    
    User *user = [[User alloc] init];
    
    // 批量赋值
    [user setValuesForKeysWithDictionary:userDict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"%@", key);
}


@end



