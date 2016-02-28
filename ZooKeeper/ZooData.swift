//
//  ZooData.swift
//  ZooKeeper
//
//  Created by hollarab on 2/18/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation

enum ZooDataNotifications:String {
    case Updated = "com.lss.zoodata.Updated"
}

public class ZooData {
    public static let sharedInstance = ZooData()
    
    private let dataFileName = "zoo"
    
    public var zoo:Zoo
    
    private init() {
        if let zoo = ZooFactory.zooFromJSONFileNamed(dataFileName) {
            self.zoo = zoo
        } else {
            self.zoo = Zoo(animals: nil, staff: nil)
        }
    }
    
    public func saveZoo() -> Bool {
        let result = ZooFactory.saveZoo(zoo, toFileNamed:dataFileName)
        if result {
            NSNotificationCenter.defaultCenter().postNotification(NSNotification(name: ZooDataNotifications.Updated.rawValue, object: nil))
        }
        return result
    }
}