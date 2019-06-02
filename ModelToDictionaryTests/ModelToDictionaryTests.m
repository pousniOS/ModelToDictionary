//
//  ModelToDictionaryTests.m
//  ModelToDictionaryTests
//
//  Created by POSUN-MAC on 2018/7/24.
//  Copyright © 2018年 POSUN-MAC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestToDicModel.h"
#import "NSObject+Dictionary.h"
@interface ModelToDictionaryTests : XCTestCase

@end

@implementation ModelToDictionaryTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testToDic{
    TestToDicModel *model=[[TestToDicModel alloc] initTest];
    id object =[model toDictionary];
    NSLog(@"%@",object);
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
