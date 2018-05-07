//
//  DictionaryTest.m
//  1-字典与集合
//
//  Created by ZhangChao on 15/11/20.
//  Copyright (c) 2015年 Chao. All rights reserved.
//

#import "DictionaryTest.h"

@implementation DictionaryTest

+ (void)test
{
    [self createDictionary];
    [self getDictionaryData];
    [self mutableDictionary];
}

/** 创建字典 */
+ (void)createDictionary
{
    // 不可变长度字典
    
    // 字典里面存放的是任意类型的 对象，使用nil作为key-value添加的结束，  value，key，...
    NSDictionary *dictionary = [[NSDictionary alloc] initWithObjectsAndKeys:@"张三", @"name", @25, @"age", @"男", @"sex", nil];
    
    // key 和 value 是一对一    value 和 key 是多对一
    dictionary = [NSDictionary dictionaryWithObjectsAndKeys:@"张三", @"name", @25, @"age", @"男", @"sex", @"张三", @"nickname", nil];
    
    // 创建字典最简化的方法 @{key: value, key....}
    // 字典是无序的
    dictionary = @{@"name": @"张三",
                   @"age": @25,
                   @"sex": @"男"};
    
    NSDictionary *dictionary1 = [NSDictionary dictionaryWithDictionary:dictionary];
    NSArray *array = @[@"1", @"2", @"3"];
    
    // 字典中的key一般都是字符串
    // 字典的嵌套使用
//    NSDictionary *dictionary2 = @{@"dict": dictionary,
//                                  @"dict1": dictionary1,
//                                  @"array": array,
//                                  @"array": @"数组"};
    NSDictionary *dictionary2 = @{@"dict": dictionary,
                                  @"dict1": dictionary1,
                                  @"array": array};
    
    NSLog(@"dictionary: %@", dictionary);
    NSLog(@"dictionary1: %@", dictionary1);
    NSLog(@"dictionary2: \n%@", dictionary2);
}

/** 取数据 */
+ (void)getDictionaryData
{
    NSDictionary *dictionary = @{@"name": @"张三",
                                 @"age": @25,
                                 @"sex": @"男",
                                 @"array": @[@"1", @"2", @"3"]};
    
    id object = [dictionary objectForKey:@"array"];
    NSArray *resultArray = [dictionary objectForKey:@"array"];
    resultArray = dictionary[@"array"];
    
    NSLog(@"resultArray: %@", resultArray);
    
    // 获取key-value 个数
    NSLog(@"%lu", dictionary.count);
    
    // 1
    // 遍历字典 for-in循环遍历的是字典中所有的key
    for (NSString *key in dictionary) {
        NSLog(@"key: %@", key);
        NSLog(@"value: %@", dictionary[key]);
    }
    
    // 获取所有的key 或 value
    NSArray *allKeys = [dictionary allKeys];
    NSArray *allValues = [dictionary allValues];
    NSLog(@"all keys: %@", allKeys);
    NSLog(@"all values: %@", allValues);
    
    // 2
    for (int i = 0; i < dictionary.count; i++) {
        NSArray *keys = [dictionary allKeys];
        NSString *key = keys[i];
        NSLog(@"%@ = %@", key, dictionary[key]);
    }
    
    // 3
    // 通过 {} 来封装一部分代码逻辑，里面的变量只生效于 {} 部分
    // 不建议在项目中大量使用
    {
        NSLog(@"===============");
        
        // 获取对象的枚举器
        NSEnumerator *enumerator = [dictionary objectEnumerator];
        
        // 通过枚举器循环遍历的都是字典的Value
        id object = nil;
        while (object = [enumerator nextObject]) {
            NSLog(@"%@", object);
        }
    }
}

/** 可变字典 */
+ (void)mutableDictionary
{
    // 不能用简易模式，创建一个可变字典
//    NSMutableDictionary *mutableDict = @{@"name": @"zhang san",
//                                         @"age": @25};
    NSDictionary *dictionary = @{@"name": @"zhang san",
                                 @"age": @25};
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    
    NSLog(@"mutable dictionary:\n%@", mutableDict);
    
    // 创建空字典
    NSMutableDictionary *emptyDict = [NSMutableDictionary dictionary];
    
    // 向字典中添加元素
    [emptyDict setObject:@"beijing" forKey:@"city"];
//    [emptyDict setObject:nil forKey:@"home"]; // setObjectForKey: object cannot be nil (key: home)'

    [emptyDict setValue:@"女" forKey:@"love"];
    [emptyDict setValue:@"男" forKey:@"sex"];
    [emptyDict setValuesForKeysWithDictionary:dictionary];
    [emptyDict setValue:mutableDict forKey:@"mutableDict"];
    
    // setValue:forKey: 在我们添加key-value的时候调用 setObject:forKey:，如果value = nil，就会调用 removeObjectForKey:
    [emptyDict setValue:@"天丰利" forKey:@"home"];
    [emptyDict setValue:nil forKey:@"home"];
    
    // 修改操作
    [emptyDict setValue:@"girl" forKey:@"sex"];
    
    // 删除操作
    [emptyDict removeObjectForKey:@"love"];
    [emptyDict removeObjectsForKeys:[emptyDict allKeys]];
    [emptyDict removeAllObjects];
    
    NSLog(@"emptyDict: %@", emptyDict);
}

@end
