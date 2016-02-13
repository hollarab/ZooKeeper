//
//  AnimalFactoryTest.swift
//  ZooKeeper
//
//  Created by hollarab on 2/4/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import XCTest
@testable import ZooKeeper

class AnimalFactoryTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_ParseValidJSONFile_CreatesAnimalArray() {
        if let zoo = AnimalFactory.zooFromJSONFileNamed("zoo") {
            XCTAssertGreaterThan(zoo.count, 0, "zoo should have items")
        } else {
            XCTFail("should have zoo")
        }
    }
    
    func test_ParseMissingJSONFile_ReturnsNil() {
        if let _ = AnimalFactory.zooFromJSONFileNamed("zoo!") {
            XCTFail("spontanious zoo?")
        } else {
            XCTAssert(true, "no animals should be returned")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            AnimalFactory.zooFromJSONFileNamed("zoo!")
        }
    }
    
}