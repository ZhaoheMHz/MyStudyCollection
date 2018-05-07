//
//  _5_NSThread03_____Tests.m
//  05-NSThread03-线程同步Tests
//
//  Created by 赵赤赤 on 15/9/14.
//  Copyright (c) 2015年 mhz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

@interface _5_NSThread03_____Tests : XCTestCase

@end

@implementation _5_NSThread03_____Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
