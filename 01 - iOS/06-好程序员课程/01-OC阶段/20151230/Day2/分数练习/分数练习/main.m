//
//  main.m
//  分数练习
//
//  Created by ZhangChao on 15/12/30.
//  Copyright (c) 2015年 1000Phone. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QFFraction.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        QFFraction *number = [[QFFraction alloc] initWithNumerator:46 denominator:142];
        [number reductionOfFraction];
    }
    return 0;
}
