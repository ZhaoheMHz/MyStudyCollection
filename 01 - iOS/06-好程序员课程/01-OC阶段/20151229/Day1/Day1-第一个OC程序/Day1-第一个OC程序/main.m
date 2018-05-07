//
//  main.m
//  Day1-第一个OC程序
//
//  Created by ZhangChao on 15/12/29.
//  Copyright (c) 2015年 1000Phone. All rights reserved.

// command + , 偏好设置
// command + B, build
// command + R, 运行程序
// command + g, 在finder下前往文件夹
// command + control + 上下左右 可以进行文件切换
// 一个工程只能有一个入口

// #import & #include
// 1.#import 用来导入类的头文件
// 2.#import 不会造成重复引用
// 3.#include 会导致交叉编译（在一个平台下使用另外一个平台的SDK）

// <> & ""
// 1.当导入系统类库时使用<>，导入自己的类就用""
// 2.<> 寻找头文件时，会到系统配置的头文件路径下进行查找
// 3."" 先到项目根路径下去查找，找不到，再到系统配置的路径下搜索

#import <Foundation/Foundation.h>
#import "Phone.h" // 一定不要导入.m
#import "Person.h"

// 1.argv[] 里面存放的是工程相关的参数
// 2.argc 记录的是 argv数组的元素个数
// 3.argv 第一个元素是程序的可执行路径

/**
 main 是程序的入口函数
 @param argc 记录的是 argv数组的元素个数
 @param argv 第一个元素是程序的可执行路径
 @returns 返回0表示程序正常退出
 */
int main1(int argc, const char * argv[]);

void printTest()
{
    // 1.NSLog() 日志打印，除了能输出结果，还可以附带日志信息
    // 2.NSLog 括号中打印格式必须是 @""
    // 3.NSLog 支持自动换行
    NSLog(@"Hello, World!");
    printf("Hello, World!");
    NSLog(@"Hello, World!");
    printf("Hello, World!\n");
    
    // 2015/12/29
    // 字符串拼接打印
    // @""是OC字符串的表示形式
    // %@ 是OC对象的占位符
    printf("%s/%d/%d\n", "2015", 12, 29);
    NSLog(@"%@/%d/%d", @"2015", 12, 29);
}

int main(int argc, const char * argv[])
{
    // @autoreleasepool {} 自动释放池，内存管理相关
    @autoreleasepool {
        // OC方法的调用，实际上就是在给接收者发送消息
        // [接收者 方法名]
        
        // new方法（类方法）
        // 1.为对象分配内存空间
        // 2.进行对象初始化
        // 3.返回对象地址
        Phone *phone = [Phone new];

        // 给属性赋值
        phone->_size = 4.7;
        phone->_memory = 512;
        phone->_color = PCGolden;
        
        // <Phone: 0x1002068c0>
        // 当使用%@打印对象时，会去调用对象的description方法
        // 当重写父类的方法后，调用该方法，系统会先去子类中查看有没有方法的实现，如果有，就执行子类的实现，如果没有再到父类中查找，如果都找不到，程序崩溃
        // OC是不允许调用一个没有实现的方法的
        NSLog(@"%@", phone);
        NSLog(@"%@", [phone description]);
        [phone about];
        
        [phone makeCallTo:@"17600800000"];
        [phone sendMessage:@"一起去撸一把"
                toReceiver:@"好基友"];
        [phone playGame];
        
        // 类方法执行效率高于对象方法
        int result =
        [Phone calculateA:10 andB:15 withSymbol:'*'];
        NSLog(@"计算结果: %d", result);
        
        
        Person *person = [Person new];
        // 通常我们通过接口（方法）来完成不同对象之间的关联通信
        [person buyPhone:phone];
    }
    
    
    return 0;
}









