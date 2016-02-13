//
//  StaffFactoryTests.swift
//  ZooKeeper
//
//  Created by hollarab on 2/13/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import XCTest
@testable import ZooKeeper

class StaffFactoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_ParseValidJSONFile_CreatesStaffArray() {
        if let staff = StaffFactory.employeesFromJSONFileNamed("zoo") {
            XCTAssertGreaterThan(staff.count, 0, "zoo should have staff")
        } else {
            XCTFail("should have staff in zoo")
        }
    }
    
    func test_ParseMissingJSONFile_ReturnsNil() {
        if let _ = StaffFactory.employeesFromJSONFileNamed("zoo!") {
            XCTFail("spontanious zoo?")
        } else {
            XCTAssert(true, "no staff should be returned")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            StaffFactory.employeesFromJSONFileNamed("zoo!")
        }
    }
    
}
