//
//  RatTests.m
//  RatTests
//
//  Created by lawn on 15/7/20.
//  Copyright (c) 2015年 zodiac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SenTestingKit/SenTestingKit.h>
#import <OCMock/OCMock.h>

@interface RatTests : SenTestCase

@end

@implementation RatTests

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
    int x = 1 , y = 1;
    
    STAssertEquals(x, y, @"x and y is not equal!");
}


@end
