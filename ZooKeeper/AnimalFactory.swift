//
//  AnimalFactory.swift
//  ZooKeeper
//
//  Created by hollarab on 2/4/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation

public class AnimalFactory {
    
    public static func zooFromJSONFileNamed(name:String) -> [Animal]? {
        if let path = NSBundle.mainBundle().pathForResource(name, ofType: "json"),
            let contentData = NSFileManager.defaultManager().contentsAtPath(path) {
                
                let json = JSON(data: contentData)
                var zoo = [Animal]()
                
                if let animals = json["animals"].array {
                    for ii in animals {
                        if let object = AnimalFactory.animalFromJSON(ii) {
                            zoo.append(object)
                        }
                    }
                }
                return zoo
        }
        return nil
    }
    
    
    public static func animalFromJSON(json:JSON) -> Animal? {
        
        let color:String = json["color"].stringValue
        let type:String = json["type"].stringValue
        let name:String = json["name"].stringValue
        let isMale:Bool = json["isMale"].boolValue
        
        if type == "Duck" {
            return Duck(name:name, color:color, isMale: isMale)
        } else if type == "Fish" {
            return Fish(name:name, color:color, isMale: isMale)
        } else if type == "Lion" {
            return Lion(name:name, color:color, isMale: isMale)
        } else if type == "Seal" {
            return Seal(name:name, color:color, isMale: isMale)
        } else if type == "Bear" {
            return Bear(name:name, color:color, isMale: isMale)
        }
        
        return nil
    }
}
