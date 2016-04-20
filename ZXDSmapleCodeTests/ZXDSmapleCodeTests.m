//
//  ZXDSmapleCodeTests.m
//  ZXDSmapleCodeTests
//
//  Created by 张雪东 on 16/4/19.
//  Copyright © 2016年 张雪东. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ZXDSmapleCodeTests : XCTestCase

@end

@implementation ZXDSmapleCodeTests

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
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self testNull];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

#pragma NSNull测试
-(void)testNull{

    XCTAssert( ((NSArray *)[NSNull null])[1] == nil);

}

@end
