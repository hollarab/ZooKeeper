//
//  Staff.swift
//  ZooKeeper
//
//  Created by hollarab on 2/13/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation

public class Staff {
    var type:String
    var name:String
    var isMale:Bool
    
    init(type:String, name:String, isMale:Bool) {
        self.type = type
        self.name = name
        self.isMale = isMale
    }
}

public class ZooKeeper : Staff {
    
    init(name:String, isMale:Bool) {
        super.init(type:"ZooKeeper", name:name, isMale:isMale)
    }
}

public class TicketTaker : Staff {
    
    init(name:String, isMale:Bool) {
        super.init(type:"TicketTaker", name:name, isMale:isMale)
    }
}

