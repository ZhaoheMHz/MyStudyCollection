//
//  main.m
//  CashSystem
//
//  Created by ZhangChao on 16/1/7.
//  Copyright (c) 2016年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CashSystem.h"

#define kFilePath @"/Users/chao/Desktop/Data.json"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        CashSystem *system = [CashSystem defaultSystem];
        
        [system readGoodsDataFromFile:kFilePath];
        [system addGoodsWithName:@"奥利奥" count:10];
        [system removeGoodsWithName:@"奥利奥" count:2];
        [system addGoodsWithName:@"卫龙" count:20];
        [system addGoodsWithName:@"水晶之恋" count:2000];
        [system addGoodsWithName:@"芙蓉王" count:20];
        [system computeTotalPrice];
    }
    return 0;
}
