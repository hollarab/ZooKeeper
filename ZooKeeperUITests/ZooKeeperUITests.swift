//
//  ZooKeeperUITests.swift
//  ZooKeeperUITests
//
//  Created by hollarab on 2/4/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import XCTest

class ZooKeeperUITests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // Failed to find matching element please file bug (bugreport.apple.com) and provide output from Console.app
    
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        app.buttons["Zoo List"].tap()
        app.tables.staticTexts["Donald"].tap()
        app.textFields["Animal Name"].tap()
        app.textFields["Animal Color"].tap()
        app.navigationBars["Master"].buttons["Master"].tap()
    }
    
}
