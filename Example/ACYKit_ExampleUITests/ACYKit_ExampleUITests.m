//
//  ACYKit_ExampleUITests.m
//  ACYKit_ExampleUITests
//
//  Created by Arthur Qiu on 24/04/2017.
//  Copyright © 2017 Arthur Liu. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface ACYKit_ExampleUITests : XCTestCase

@end

@implementation ACYKit_ExampleUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
	
	
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
	
	
	XCUIApplication *app = [[XCUIApplication alloc] init];
	[app.tables.staticTexts[@"5"] tap];
	[[[[app.navigationBars[@"ACYDetailView"] childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Back"] elementBoundByIndex:0] tap];
	
	
	
}

@end
