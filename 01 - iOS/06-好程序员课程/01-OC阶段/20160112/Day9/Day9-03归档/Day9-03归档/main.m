//
//  main.m
//  Day9-03归档
//
//  Created by ZhangChao on 16/1/12.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
#if 0
        Person *person = [[Person alloc] init];
        person.name = @"Tom";
        person.age = 10;
        person.sex = @"Female";
        
        // 归档对象
        NSData *personData = [NSKeyedArchiver
         archivedDataWithRootObject:person];
        NSLog(@"%@", personData);
        
        // 写入本地文件
        // 如果查看结构，可以添加 .plist 后缀
        [personData writeToFile:@"/Users/chao/Desktop/iOS-BJ1507/OC阶段/Day9/personData" atomically:YES];
#endif
        
        // 解档
        NSData *personData =
        [NSData dataWithContentsOfFile:@"/Users/chao/Desktop/iOS-BJ1507/OC阶段/Day9/personData"];
        
        Person *person =
        [NSKeyedUnarchiver
         unarchiveObjectWithData:personData];
        
        // 多个对象的归档
        Person *person1 = [[Person alloc] init];
        person1.name = @"xiaohong";
        person1.age = 20;
        person1.sex = @"male";
        
        NSDictionary *dict = @{@"name": @"Tom"};
        
        // 把对象转换成data
        NSFileManager
        NSMutableData *data =
        [NSMutableData data];
        
        // 生成一个归档对象，归档开始
        // data 是编码后的对象数据的容器，开始归档后，调用 encodeObject:forKey:，系统会自动把转码后的数据存入data，归档完成后，必须调用 finishEncoding 方法
        NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
        
        // 编码person对象
        [archiver encodeObject:person1
                        forKey:@"person"];
        
        // 编码字典对象
        [archiver encodeObject:dict
                        forKey:@"dict"];
        
        // 结束归档
        [archiver finishEncoding];
        NSLog(@"%@", data);
        
        // 如何解档？
    }
    return 0;
}








