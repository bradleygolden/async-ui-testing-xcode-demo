//
//  Async_UI_TestingUITests.m
//  Async UI TestingUITests
//
//  Created by Bradley Golden on 1/12/16.
//  Copyright © 2016 Bradley Golden. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface Async_UI_TestingUITests : XCTestCase

@end

@implementation Async_UI_TestingUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testButton {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *contactButton = app.buttons[@"contactButton"];
    
    // tap the submit button
    [app.buttons[@"submitButton"] tap];
    
    // press the contact button
    [contactButton tap];
}

- (void)testButtonSync {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *contactButton = app.buttons[@"contactButton"];
    
    // tap the submit button
    [app.buttons[@"submitButton"] tap];
    
    // wait 10 seconds to segue to the next view
    [NSThread sleepForTimeInterval:10];
    
    // press the contact button
    [contactButton tap];
}

- (void)testButtonAsync {
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    XCUIElement *contactButton = app.buttons[@"contactButton"];
    
    NSPredicate *exists = [NSPredicate predicateWithFormat:@"exists == 1"];
    
    [app.buttons[@"submitButton"] tap]; // tap the submit button
    
    // perform async loop, waiting for the object specified to appear
    [self expectationForPredicate:exists evaluatedWithObject:contactButton handler:nil];
    
    [self waitForExpectationsWithTimeout:10 handler:nil]; // wait no longer than 10 seconds for the request to go through
    
    [contactButton tap]; // this object has been found, perform this action
}

@end
