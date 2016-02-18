//
//  ZooTestCase.swift
//  ZooKeeper
//
//  Created by hollarab on 2/18/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import XCTest
@testable import ZooKeeper

class ZooTestCase: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func test_savingImage_updatesHasImage() {
        // This is an example of a functional test case.
        let image = UIImage(named: "camera")
        XCTAssertNotNil(image, "need an image")
        
        let animal = Duck(name: "Pete", color: "Blue", isMale: true)
        XCTAssert(animal.saveImage(image!), "saving should return true")
        XCTAssert(animal.hasImage(), "animal should have image")
        let loadedImage = animal.loadImage()
        XCTAssertNotNil(loadedImage, "animal image should load off disk")   
    }
    
    
}
