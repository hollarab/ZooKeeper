//
//  ZooDataTestCase.swift
//  ZooKeeper
//
//  Created by hollarab on 2/18/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import XCTest
@testable import ZooKeeper

class ZooDataTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_singleton_worksAndHasZoo() {
        // This is an example of a functional test case.
        let zoo = ZooData.sharedInstance.zoo
        XCTAssert(zoo.staff.count > 0, "zoo should have staff")
        XCTAssert(zoo.animals.count > 0, "zoo should have animals")
    }
    
    func test_singleton_isSameInstance() {
        // This is an example of a functional test case.
        let zoo = ZooData.sharedInstance.zoo
        let zoo2 = ZooData.sharedInstance.zoo
        XCTAssert(zoo === zoo2, "singleton should always return the same instances")
    }
}
