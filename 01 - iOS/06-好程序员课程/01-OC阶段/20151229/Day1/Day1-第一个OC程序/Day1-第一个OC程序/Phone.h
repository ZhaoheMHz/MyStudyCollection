//
//  Phone.h
//  Day1-第一个OC程序
//
//  Created by ZhangChao on 15/12/29.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
// 类文件系统组成：.h & .m
// 类的声明文件构成 @interface 类名 : 直属父类
// NSObject 所有OC类都直接或间接的继承NSObject
// 类的声明部分是从 @interface 开始，到 @end 结束

// 如果变量的值是有限可选时，我们就可以使用枚举类型，使其语义更加明确
typedef enum _PhoneColor {
    PCWhite,
    PCBlack,
    PCGolden
} PhoneColor;

@interface Phone : NSObject
{// 在 {} 中，完成属性（成员变量）的声明
    
    // 成员变量名称一定要以 “_” 开头
    // OC名称命名规则都要遵循 驼峰原则
    // 以下划线开头命名成员变量，可以和局部变量以及形参相区分
    
    // 成员变量的作用域
    // @private 私有, 只能在当前类中使用
    // @protected 受保护, 只能在当前类或其子类中进行访问
    // @public 公有，在类的外部可以直接访问
    // OC的成员变量默认是 @protected
    @public
    float _size;
    float _memory;
    /** 颜色默认为白色 */
    PhoneColor _color;
}

// OC方法语法
// -/+ (返回值类型)标签名:(参数类型)参数名称 标签名1:(参数类型)参数名称;
// OC方法是由一个或多个标签组成
- (void)makeCallTo:(NSString *)receiver;
- (void)sendMessage:(NSString *)message
         toReceiver:(NSString *)receiver;
- (void)playGame;
- (void)about;
+ (int)calculateA:(int)a
             andB:(int)b
       withSymbol:(char)symbol;

// 方法的使用场景
// 1.如果方法的内部实现，涉及到属性的使用，就需要对象方法
// 2.如果方法的实现只是完成一些计算，或算法，不涉及到属性的使用，就可以使用类方法 

@end










