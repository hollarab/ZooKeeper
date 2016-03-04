//
//  ZooData.swift
//  ZooKeeper
//
//  Created by hollarab on 2/18/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation
import Firebase

let kFirebaseAppId = "zoo-swift-t1-2016"

enum ZooDataNotifications:String {
    case Updated = "com.lss.zoodata.Updated"
}

public class ZooData {
    public static let sharedInstance = ZooData()
    
    private let dataFileName = "zoo"
    
    let rootRef = Firebase(url: "https://\(kFirebaseAppId).firebaseio.com/")
    
    public var zoo:Zoo
    
    private init() {
        
//        if let zoo = ZooFactory.zooFromJSONFileNamed(dataFileName) {
//            self.zoo = zoo
//            ZooFactory.pushZooToFirebase(rootRef, zoo: zoo)
//        } else {
            self.zoo = Zoo(animals: nil, staff: nil)
//        }
    }
    
    public func saveZoo() -> Bool {
        
        return true
    }
    
    
    private func saveLocal() -> Bool {
        let result = ZooFactory.saveZoo(zoo, toFileNamed:dataFileName)
        if result {
            NSNotificationCenter.defaultCenter().postNotificationName(ZooDataNotifications.Updated.rawValue, object: nil)
        }
        return result
    }
}

