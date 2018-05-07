//
//  main.m
//  Day6-01手动内存管理
//
//  Created by ZhangChao on 16/1/8.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

/*
 * 1.内存区域
    》堆区（heap）: 是由程序员手动进行内存分配的，使用完成之后，需要手动进行释放。如果没有释放，会造成内存泄露；如果多次释放，就会造成内存崩溃，或者段错误
 
    》栈区（stack）: 是由系统自动分配，程序运行结束后，自动回收
    》数据区，文字常量区，代码区，bss
  
    2.内存管理
    》系统对内存的管理
    》手动内存管理（MRC，手动引用计数）, retainCount(用来记录当前对象的持有数量)
    》retainCount 是否等于 0，是对象被回收的唯一标识(这是给系统看的)
    》dealloc 方法调用的时候，就是这个对象被销毁的时候(程序员看的)
    
 java 垃圾回收机制（惰性机制）
 
    3.内存管理原则：只要使用以alloc，new，copy，mutableCopy，retain开头的方法将一个对象的地址赋给一个指针变量时，就拥有这个对象的绝对使用权，使用后，就要进行release 或 autorelease 来释放对象
 
    》以alloc，new，copy，mutableCopy，retain开头的方法都会造成 retainCount + 1
    》release 或 autorelease 会造成retainCount - 1
    》个人顾个人（哪个指针强引用对象，就由哪个指针来进行释放，不要去管其他指针）
 
    Xcode-->工程设置-->Build setting-->搜索gar
 */

#import <Foundation/Foundation.h>
#import "Person.h"

// 1.内存泄露
// 2.内存崩溃
// 3.僵尸对象
void mrcTest()
{
    Person *person = [Person new];
    // retainCount不要去使用
    //        NSLog(@"retainCount: %lu", person.retainCount);
    
    [person release];
    // Do not use this method. (required)
    //        NSLog(@"retainCount: %lu", person.retainCount);
    
    // person1 没有release，导致内存泄露
    //        Person *person1 = [[Person alloc] init];
    
    Person *person1 = [[Person alloc] init];
    [person1 work];
    
    // 一个对象一旦被销毁，就变成了僵尸对象
    // 编译器不会实时监听僵尸对象，所以会导致有事可以运行，有时报错的结果
    // 当一块内存回收之后，系统不会立即清理这块空间的数据，会一直保留到下次新数据写入时，进行数据覆盖
    [person1 release];
    
    // 多次释放，会造成内存崩溃
//    [person1 release];
    
    // 访问了一块非法的内存空间
    // 对象销毁之后就不要再用指针继续操作该对象
    //        [person1 work];
}

void mrcTest1()
{
#if 0
    Person *person = [[Person alloc] init];
    [person work];
    
    
    Person *person1 = person;
    
    [person release];
    // 个人顾个人，person1不要去管person的对象
    //        [person1 release];
    
    
    // 内存崩溃
    //        [person release];
    
    // 僵尸对象
    //        [person1 work];
#endif
    
    Person *person = [[Person alloc] init];
    
    // retain一个现有的对象，就代表强引用这个对象，会造成引用计数+1
    // Person *person1 = person
    Person *person1 = [person retain];
    
    // release 代表释放对象(指针不再强引用对象)，不代表销毁对象
    
    [person1 release];
    [person release];
}

int main(int argc, const char * argv[])
{
    // 只要使用以alloc，new，copy，mutableCopy，retain开头的方法将一个对象的地址赋给一个指针变量时，这个指针就拥有这个对象的绝对使用权，使用后，就要进行release 或 autorelease 来释放对象
    
    // 自动释放池：@autoreleasepool {}
    // 自动释放池只会管理 被autorelease之后的对象
    @autoreleasepool {// 开始
        
        // 要放入自动释放池，必须满足
        // 1.这个对象是被autorelease标记之后的
        // 2.代码要写在autoreleasepool的花括号中
        // 自动释放池过去写法
        // 自动释放池的数据结构满足栈的特点
        @autoreleasepool {
            Person *person = [Person person];
            Person *person1 = [person retain];
            
            [person1 release];
        }
        
        // person1 不在自动释放池中
//        Person *person1 = [[Person alloc] init];
//        [person1 release];
        
    } // 清倒自动释放池
    
//    Person *person1 = [Person person];
//    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
//    
//    // 往池中添加对象
//    [pool addObject:person1];
//    
//    [pool drain];
//    [pool release];
    
    return 0;
}

// 分析编译：command + shift + B
// 清理工程：command + shift + k







