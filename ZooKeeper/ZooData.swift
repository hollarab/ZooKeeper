//
//  ZooData.swift
//  ZooKeeper
//
//  Created by hollarab on 2/18/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation

public class ZooData {

    private let dataFileName = "zoo"
    
    public static let sharedInstance = ZooData()
    
    public var zoo:Zoo

    private init() {
        if let zoo = ZooFactory.zooFromJSONFileNamed(dataFileName) {
            self.zoo = zoo
        } else {
            self.zoo = Zoo(animals: nil, staff: nil)
        }
    }
    
    public func saveZoo() -> Bool {
        return ZooFactory.saveZoo(zoo, toBundleFile: dataFileName)
    }
    
}