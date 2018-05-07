//
//  ArrayTest.m
//  Day4-02集合
//
//  Created by ZhangChao on 16/1/5.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "ArrayTest.h"
#import "Person.h"

// OC集合 (有序、无序)
// 1.Array：存储的是任意类型的对象

// 2.Dictionary
// 3.Set

@implementation ArrayTest

+ (void)test
{
//    [self createArray];
//    [self traverseArray];
    [self sortArray];
//    [self otherMethods];
//    [self mutableArray];
}

/** 创建不可变数组 */
+ (void)createArray
{
    // 不可变：元素个数不可变，元素类型不可变，对象地址不可变
    // nil: nil在数组中，代表的是添加元素的结束标志，为了防止野指针的访问
    // OC数组实际上存放的是对象的地址
    
    // 1
    NSArray *array =
    [[NSArray alloc] initWithObjects:@"one", @"two", @"three", nil];
    
    // 获取数组元素个数
    NSLog(@"count = %lu", array.count);
    
    // 数组创建时，会从前往后添加元素，知道第一个nil出现，结束添加，之后即便再有其他内容，也会忽略不计
    NSString *string;
    // 2
    array =
    [NSArray arrayWithObjects:
     @"1", @"2", string, @"4", nil];
    
    NSLog(@"count = %lu\n %@", array.count, array);
    
    // 3.创建不可变数组最简化的方式
    // 这种方式不需要在结尾添加nil，作为结束
    
    // NSNumber OC中对数字的封装，数字对象
    // 1.NSNumber 是用来把基本数据类型转换为对象的
    NSNumber *three = [NSNumber numberWithInt:3];
    NSNumber *four = @4;
    array = @[@"one", @"two", @(1), @2, three];
    
    NSLog(@"array: %@", array);
    
    // 4.数组的嵌套
    // 开发中，数组元素类型尽量保持统一
    array = @[@"one", array];
    NSLog(@"array: %@", array);
    
    // 通过泛型指针id 来获取元素
    // 获取对象类型的方法：[对象 class]
    id object = [array objectAtIndex:0];
    NSLog(@"object(%@): %@",
          [object class], object);

    // 获取元素最简单的方式
    NSArray *array1 = array[1];
    
    NSString *string1 = @"one";
    NSArray *array2 = @[string1];
    NSLog(@"%@", array2);
    
    // 数组中存放的是指针指向的对象的地址
    string1 = @"two";
    NSLog(@"%@", array2);
    
    NSMutableString *string2 =
    [NSMutableString stringWithString:@"one"];
    
    array2 = @[string2];
    NSLog(@"%@", array2);
    
    [string2 setString:@"two"];
    NSLog(@"%@", array2);
    
}

/** 数组遍历 */
+ (void)traverseArray
{
    NSArray *array = @[@"1", @"2", @"3", @"4"];
    
    // 1.使用普通for循环
    for (NSInteger i = 0; i < array.count; i++) {
        NSLog(@"object: %@", array[i]);
    }
    
    // 2.forin循环可以用来遍历OC任意集合类型
    // forin（快速枚举）
    // 如果不关心数组的下标，就可使使用forin
    for (NSString *object in array) {
        NSLog(@"object: %@", object);
    }
    
    // 3.通过枚举器进行遍历
    
    // 获取数组中的枚举器
    NSEnumerator *enumerator =
    [array objectEnumerator];
    
    // 访问数组中第一个元素
    id object = [enumerator nextObject];
    
    while (object) {
        NSLog(@"object: %@", object);
        object = [enumerator nextObject];
    }
}

/** 数组排序 */
+ (void)sortArray
{
    NSArray *array =
  @[@"5", @"3", @"4", @"1", @"2"];
    
    // 通过选择其中的方法进行数组排序
    // SEL(selector)选择器
    // 严格意义上，OC不存在直接的方法调用
    // 选择其中存放的是方法名称
    // 只要是工程中存在的方法选择器都可以找到
    // 选择器会先去接收者所在的类中查找有没有该方法，如果没有，就顺着继承关系，查找父类，找不到程序崩溃，这个过程叫做消息转发（消息传递）
    
    SEL selector = @selector(compare:);
    NSString *string = @"";
    // [string compare:@"123"];
    // 调用选择器中方法的方式
    [string performSelector:selector withObject:@"123"];
    
    // [接收者 方法名] 这个过程依赖于Runtime机制
    
    // objc_msgSend(id theReceiver, SEL theSelector, ...) 发送消息的底层调用
    
    // 选择器中填入的方法，取决于数组中存放的对象的类型
    NSArray *resultArray =
    [array sortedArrayUsingSelector:@selector(compare:)];
    
    NSLog(@"%@", resultArray);
    
    Person *person =
    [Person personWithName:@"xiaohong" age:2];
    Person *person1 =
    [Person personWithName:@"tom" age:14];
    Person *person2 =
    [Person personWithName:@"xiaohong" age:10];
    Person *person3 =
    [Person personWithName:@"abc" age:50];
    Person *person4 =
    [Person personWithName:@"chenglong" age:30];
    
    array =
  @[person, person1, person2, person3, person4];
    
    resultArray =
    [array sortedArrayUsingSelector:@selector(comparePerson:)];
    
    NSLog(@"%@", resultArray);
    
    // 通过 Descriptor 进行排序
    // 第一个参数：要进行排序的对象中的属性名称
    // 第二个参数：是否进行升序排列
    // 方法本身是用来规定数组排序规则的
    NSSortDescriptor *desc1 =
    [NSSortDescriptor
     sortDescriptorWithKey:@"name" ascending:NO];
    
    NSSortDescriptor *desc2 =
    [NSSortDescriptor
     sortDescriptorWithKey:@"age" ascending:NO];
    
    resultArray =
    [array sortedArrayUsingDescriptors:@[desc1, desc2]];
    NSLog(@"%@", resultArray);
}

+ (void)otherMethods
{
    NSArray *array = @[@"1", @"2", @"3", @"4"];
    
    // 1.获取数组第一个或最后一个元素
    NSLog(@"%@", array.firstObject);
    NSLog(@"%@", array.lastObject);
    
    // 2.拼接元素
    NSString *string = @"i love u so much";
    NSArray *array1 =
    [string componentsSeparatedByString:@" "];
    
    NSString *string1 = [array componentsJoinedByString:@"."];
    NSLog(@"%@", string1);
}

/** 可变数组的使用 */
+ (void)mutableArray
{
    // 1.创建空数组
    NSMutableArray *array =
    [NSMutableArray array];
    
    // 2.添加元素（在数组末尾进行追加）
    [array addObject:@1];
    [array addObject:@"one"];
    
    // 3.插入元素
    [array insertObject:@2 atIndex:1];
    
    // 如何插入多个元素?
    // 该方法需要将元素和 index 一一对应
    // 1 two three 2 one
//    [array insertObjects:@[@"two", @"three"] atIndexes:nil];
    
    // 4.删除元素(删除所有出现的元素)
    [array addObject:@1];
    [array addObject:@1];
    [array addObject:@1];
    [array removeObject:@1];
    
    // 删除所有元素
//    [array removeAllObjects];
    
    // 5.替换元素
    // 2, one
    [array replaceObjectAtIndex:0 withObject:@1];
    
    
    NSLog(@"array: %@", array);
}

@end







