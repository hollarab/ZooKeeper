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
            self.zoo = Zoo(animals: nil, staff: nil)
    }
}

