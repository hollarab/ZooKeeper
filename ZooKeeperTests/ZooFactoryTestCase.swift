//
//  ZooFactoryTestCase.swift
//  ZooKeeper
//
//  Created by hollarab on 2/18/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import XCTest
@testable import ZooKeeper

class ZooFactoryTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_ParseValidJSONFile_CreatesStaffArray() {
        if let zoo = ZooFactory.zooFromJSONFileNamed("zoo") {
            XCTAssertGreaterThan(zoo.staff.count, 0, "zoo should have staff")
            XCTAssertGreaterThan(zoo.animals.count, 0, "zoo should have animals")
        } else {
            XCTFail("should have staff in zoo")
        }
    }
    
    
    func test_saveZoo_works() {
        if let zoo = ZooFactory.zooFromJSONFileNamed("zoo") {
            let saved = ZooFactory.saveZoo(zoo, toBundleFile: "zoo2")
            XCTAssert(saved, "should have saved zoo")
        } else {
            XCTFail("should have staff in zoo")
        }
    }
    
    func test_loadSavedZoo_hasNewStuff() {
        if let zoo = ZooFactory.zooFromJSONFileNamed("zoo") {
            zoo.animals.append(Duck(name: "name", color: "color", isMale: true))
            let saved = ZooFactory.saveZoo(zoo, toBundleFile: "zoo2")
            XCTAssert(saved, "should have saved zoo")
            
            if let zoo2 = ZooFactory.zooFromJSONFileNamed("zoo2") {
                XCTAssert(zoo.animals.count == zoo2.animals.count, "new zoo should have new animal")
            } else {
                XCTFail("new zoo should have loaded")
            }
        } else {
            XCTFail("should have staff in zoo")
        }
    }
    
    func test_ParseMissingJSONFile_ReturnsNil() {
        if let _ = ZooFactory.zooFromJSONFileNamed("zoos") {
            XCTFail("spontanious zoo?")
        } else {
            XCTAssert(true, "no staff should be returned")
        }
    }

    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            if let _ = ZooFactory.zooFromJSONFileNamed("zoo") {
                XCTAssert(true)
            } else {
                XCTFail("should have staff in zoo")
            }
        }
    }
    
}
