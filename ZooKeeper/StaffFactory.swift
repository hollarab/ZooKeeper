//
//  StaffFactory.swift
//  ZooKeeper
//
//  Created by hollarab on 2/13/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation

public class StaffFactory {
    
    public static func employeesFromJSONFileNamed(name:String) -> [Staff]? {
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: "json"),
            let contentData = NSFileManager.defaultManager().contentsAtPath(path) {
                
                let json = JSON(data: contentData)
                var employees = [Staff]()
                
                if let animals = json["staff"].array {
                    for ii in animals {
                        if let object = StaffFactory.staffFromJSON(ii) {
                            employees.append(object)
                        }
                    }
                }
                return employees
        }
        return nil
    }
    
    
    public static func staffFromJSON(json:JSON) -> Staff? {
        
        let type:String = json["type"].stringValue
        let name:String = json["name"].stringValue
        let isMale:Bool = json["isMale"].boolValue
        
        if type == "ZooKeeper" {
            return ZooKeeper(name:name, isMale: isMale)
        } else if type == "TicketTaker" {
            return TicketTaker(name:name, isMale: isMale)
        }
        
        return nil
    }
}
