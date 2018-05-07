//
//  DictionaryTest.m
//  Day4-02集合
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "DictionaryTest.h"

@implementation DictionaryTest

+ (void)test
{
//    [self createDictionary];
//    [self traverseDictionary];
    [self mutableDictionary];
}

/** 创建不可变字典 */
+ (void)createDictionary
{
    // 字典无序集合，key-value（键值对）
    // 字典查找数据：根据key，查找value
    // 映射关系:
    // 1.key->value映射，一个key只能对应一个value，key是唯一的
    // 2.一个value可以对应多个key
    // 3.key的唯一性，决定了字典中不能重复添加相同的key
    // 4.实际开发中，key一般都是NSString类型的对象
    NSDictionary *dict =
    [NSDictionary dictionaryWithObjectsAndKeys:
     @"one", @"1", @"two", @"2", nil];
    
    // 创建字典的简化方式(推荐)
    // 写的时候，按照key：value的格式
    // 字典中，key 和 value 不能是nil，语法错误
#if 0
    NSString *key = nil;
    dict = @{@"name": @"Tom",
             @"nickname": @"tangmu",
             @"age": @12,
             key: @"value",
             @"sex": @"male"};
#endif
    
    dict = @{@"name": @"Tom",
             @"nickname": @"tangmu",
             @"age": @12,
             @"sex": @"male"};
    
    NSLog(@"\n=============");
    // 取值
    
    // 1
    // 如果key在字典中找不到，就会返回nil
    NSString *name = [dict objectForKey:@"name"];
    // 2
    NSString *sex = dict[@"sex"];
    
    NSLog(@"\nname = %@\n sex = %@", name, sex);
    
    NSLog(@"\n=============");
    // 映射关系
    
    // 如果存在相同的key，只会识别第一个
    dict = @{@"name": @"Tom",
             @"name": @"tangmu",
             @"age": @12,
             @"sex": @"male"};
    NSLog(@"%@", dict);
    
    // 如何根据value，来获取所有的key
    dict = @{@"name": @"Tom",
             @"nickname": @"Tom",
             @"age": @12,
             @"sex": @"male"};

    NSLog(@"%@", [dict allKeysForObject:@"Tom"]);
    
    // 获取字典中所有的key 或 value
    NSLog(@"%@", dict.allKeys);
    NSLog(@"%@", dict.allValues);
    
    // 字典的嵌套使用
    dict = @{@"name": @"Tom",
             @"nickname": @"Tom",
             @"array": @[@1, @2],
             @"dict": @{@"array": @[@"1"]},
             @"age": @12,
             @"sex": @"male"};
    
    NSLog(@"%@", dict);
}

/** 字典遍历 */
+ (void)traverseDictionary
{
    NSDictionary *dict = @{@"name": @"Tom",
                           @"nickname": @"tangmu",
                           @"age": @12,
                           @"sex": @"male"};
    // 遍历value
    for (id object in dict.allValues) {}
    
    // 遍历字典
    // 快速枚举字典中所有的key
    for (NSString *key in dict) {
        NSLog(@"value :%@", dict[key]);
    }
}

+ (void)mutableDictionary
{
    NSDictionary *dict = @{@"name": @"Tom",
                           @"nickname": @"tangmu",
                           @"age": @12,
                           @"sex": @"male"};
    
    NSMutableDictionary *mutableDict =
    [NSMutableDictionary dictionary];
    
    // 1.从其他字典中添加键值对
    [mutableDict addEntriesFromDictionary:dict];
    
    // 2.添加一对key-value
    [mutableDict setObject:@170 forKey:@"height"];
    
    // 3.修改字典中key对应的value
    [mutableDict setObject:@"xiaohong"
                    forKey:@"name"];
    
    // 4.删除操作
    [mutableDict removeObjectForKey:@"height"];
//    [mutableDict setObject:nil forKey:@"name"];
    
    // setValue:forKey:方法，如果发现value = nil，就会去调用字典的 removeObjectForKey；否则，就会调用 setObject:forKey:
    [mutableDict setValue:nil forKey:@"name"];
    
    NSLog(@"%@", mutableDict);
}

@end







