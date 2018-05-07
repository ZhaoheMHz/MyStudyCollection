//
//  StringTest.m
//  Day3-01字符串的使用
//
//  Created by ZhangChao on 16/1/4.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import "StringTest.h"
// 学习系统类库的思路
// 1.NSString 干嘛的
// 2.系统给我们提供了哪些接口（对象创建，使用）
// 3.注意使用的时候有哪些地方需要小心使用

@implementation StringTest

+ (void)test
{
    // NSString 严格意义上叫做 类簇
//    [self createString];
    [self appendSeparatedString];
//    [self compareString];
//    [self otherMethods];
    
//    NSString *string = @"0123";
//    NSLog(@"%@", [NSString reverseString:string]);
//    [self mutableString];
}

+ (void)mutableString
{
    // NSMutableString 父类是 NSString
    // 可变是指内存空间本身是可以更改的
    
    // 1.创建空得可变字符串
    NSMutableString *string =
    [NSMutableString string];
    
    // setString: 每次赋值都会对原值进行全部覆盖
    [string setString:@"可变字符串"];
    [string setString:@"123"];
    
    // 2.插入字符串
    [string insertString:@"可变字符串" atIndex:1];
    
    // 3.追加字符串
    [string appendString:@"-1000phone.com"];
    
    // 4.删除操作
    [string deleteCharactersInRange:[string rangeOfString:@"23"]];
    
    // 删除所有字符
//    [string setString:@""];
    
    // 5.修改字符串
    // 1可变字符串-1000phone.com
    // 注意：如果给定的范围长度，要大于替换字符串的长度时，后面多出的部分会进行删除
    [string replaceCharactersInRange:NSMakeRange(6, 6) withString:@"www."];
    
    NSLog(@"string: %@", string);
}

/** 不可变字符串创建 */
+ (void)createString
{
    // NSString 不可变是指，字符串的内容和长度不可变
    // 1.对不可变对象进行默认初始化是没有意义的
    NSString *string = [[NSString alloc] init];
    NSLog(@"%p: %@", string, string);
    NSLog(@"%lu", string.length);
    
    // 2.这是创建不可变字符串的最简化方式
    // 首先分配空间，然后把字符串存入，最后返回空间地址
    string = @"hello world";
    NSLog(@"%p: %@", string, string);
    
//    NSString *string2 = [[NSString alloc] initWithString:@"hello world"];
    
    // OC字符串使用的是享元模式，可以节省内存资源
    // 享元模式：字符串创建比较消耗内存资源，当创建一个字符串时，系统会把其放入数据缓冲区，下次使用相同的字符串常量时，无需再次创建新的对象，直接取出即可
    NSString *string2 = @"hello world";
    NSLog(@"%p: %@", string2, string2);
    
    // 3.c字符串 转 OC字符串
    const char *cString = "utf-8 string";
    string2 = [[NSString alloc] initWithCString:cString encoding:NSUTF8StringEncoding];
    
    // 使用类方法类创建对象时，可以省去alloc
    string2 = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
    
    // 4.格式化字符串
    string2 =
    [[NSString alloc] initWithFormat:
     @"%@年%d月%d日", @"2016", 1, 4];
    NSLog(@"string2 %@", string2);
    
    // 字符串拼接
    NSString *string3 = @"www.";
    NSString *string4 = @"1000phone.com";
    NSString *string5 = [[NSString alloc] initWithFormat:@"%@%@", string3, string4];
    NSLog(@"string5 %@", string5);
    
    string2 = @"hello";
    NSLog(@"%p: %@", string2, string2);
    string2 = [[NSString alloc] initWithString:@"hello"];
    NSLog(@"%p: %@", string2, string2);
    
    // initWithFormat: 是不会从字符串的数据缓冲区中进行存取的
    NSString *string6 = [[NSString alloc] initWithFormat:@"%@", @"hello"];
    NSLog(@"%p: %@", string6, string6);
}

/** 字符串的拼接和分割 */
+ (void)appendSeparatedString
{
    // 1.字符串拼接
    // 不可变字符串拼接后，会把新的字符串地址返回
    NSString *string = @"www.";
    NSLog(@"%p", string);
    
    string =
    [string
     stringByAppendingString:@"1000phone.com"];
    NSLog(@"string : %@", string);
    
    string = [string stringByAppendingFormat:
              @"-%@", @"千锋网站"];
    NSLog(@"string: %@", string);
    
    // 2.字符串分割
    NSArray *components =
    [string componentsSeparatedByString:@"-"];
    NSLog(@"%@", components);
    
    // 从给定的字符串中读取字符，存入字符集合
    NSCharacterSet *set =
    [NSCharacterSet
     characterSetWithCharactersInString:@".-"];
    
    components =
    [string componentsSeparatedByCharactersInSet:set];
    NSLog(@"%@", components);
    
    // 3.获取子串
    string = @"comwww.1000phone.com";
    
    // 索引值从0开始计数
    NSString *substring = [string substringFromIndex:4];
    NSLog(@"substring: %@", substring);
    
    // 不包含给定索引值对应的字符
    substring = [string substringToIndex:4];
    NSLog(@"substring: %@", substring);
    
    // 从location位置开始往后数length长度的字符
    substring = [string substringWithRange:NSMakeRange(4, 9)];
    NSLog(@"substring: %@", substring);
    
    // 获取字符串的范围
    NSRange range = [string rangeOfString:@"com"];
    NSLog(@"loc = %lu, length = %lu",
          range.location, range.length);
}

/** 字符串比较方法 */
+ (void)compareString
{
    NSString *string1 = @"hello";
    NSString *string2 = @"hello";
    
    if (string1 == string2) {
        NSLog(@"string1 == string2");
    }
    else {
        NSLog(@"string1 != string2");
    }
    
    NSString *string3 =
    [NSString stringWithFormat:@"%@", @"hello"];
    
    // 直接比较是对对象地址进行的判断，不是判断对象本身
    if (string1 == string3) {
        NSLog(@"string1 == string3");
    }
    else {
        NSLog(@"string1 != string3");
    }
    
    // 判断俩字符串相等 isEqualToString:
    // hello hello
    // 1.判断地址是否相同，如果不同，执行2
    // 2.判断长度是否一样，如果相同，执行3
    // 3.逐个字符进行比较
    if ([string1 isEqualToString:string3]) {
        NSLog(@"string1 == string3");
    }
    else {
        NSLog(@"string1 != string3");
    }
    
    // 2.字符串比较方法
    // 比较方法：根据字符的ASCII码来进行对比，从第一个开始，如果相同继续比较下一个，如果不同，直接返回比较结果；如果长度小得那个字符串中的字符，和长度大中的字符前几个都相同，最后比较结果，就是按长度来进行对比
    
    // 转义字符在OC字符串中算一个单位长度
    // 不要再OC字符串中手动添加 "\0"
    string1 = @"abc\nabc";
    string3 = @"abcccczzz";
    NSComparisonResult result =
    [string1 compare:string3];
    
    switch (result) {
        case NSOrderedAscending:
            NSLog(@"%@", string1);
            NSLog(@"length= %lu", string1.length);
            break;
        case NSOrderedSame:
            NSLog(@"string1 = string3");
            break;
        case NSOrderedDescending:
            NSLog(@"string1 > string3");
            break;
            
        default:
            break;
    }
    
    // 面试
    // 通过字符串比较方法，判断两个字符串对象是否相同
    string1 = @"1000phone";
    string3 = nil;
    
    if (string1 && [string1 compare:string3] == NSOrderedSame) {
        NSLog(@"相同");
    }
    else {
        NSLog(@"不同");
    }
}

+ (void)otherMethods
{
    NSString *string = @"www.1000phone.com";
    
    NSLog(@"length = %lu", string.length);
    NSLog(@"Upper: %@", string.uppercaseString);
    NSLog(@"Lower: %@", string.lowercaseString);
    BOOL result = [string hasPrefix:@"www."];
    
    /*
     Copies characters from a given range in the receiver into a given buffer.
     This method does not add a NULL character.
     The abstract implementation of this method uses characterAtIndex: repeatedly, correctly extracting the characters, though very inefficiently. Subclasses should override it to provide a fast implementation.
     Parameters
     buffer
     Upon return, contains the characters from the receiver. buffer must be large enough to contain the characters in the range aRange (aRange.length*sizeof(unichar)).
     aRange
     The range of characters to retrieve. The range must not exceed the bounds of the receiver.
     Important
     Raises an NSRangeException if any part of aRange lies beyond the bounds of the receiver.
     */
    [string getCharacters:nil range:NSMakeRange(0, 0)];
}

@end








