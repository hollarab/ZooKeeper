//
//  ZooFactory.swift
//  ZooKeeper
//
//  Created by hollarab on 2/18/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation
import Firebase

public class ZooFactory {
    
    private var ref:Firebase?
    
    public static func zooFromJSONFileNamed(name:String) -> Zoo? {
        // Check to see if we have one in the docs dir
        var storePath:String!
        
        if let path = pathToExistingFileInDocumentsDirectory(name + ".json") {
            print("loaded from docs dir")
            storePath = path
        } else if let path = NSBundle.mainBundle().pathForResource(name, ofType: "json"){
            print("loaded from bundle")
            storePath = path
        } else {
            return nil
        }
        
        if let contentData = NSFileManager.defaultManager().contentsAtPath(storePath) {
                
                let json = JSON(data: contentData)
                let zoo = Zoo(animals: nil, staff: nil)
                
                if let animals = json["animals"].array {
                    for ii in animals {
                        if let object = animalFromJSON(ii) {
                            zoo.animals.append(object)
                        }
                    }
                }
                
                if let staff = json["staff"].array {
                    for ii in staff {
                        if let object = staffFromJSON(ii) {
                            zoo.staff.append(object)
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
        
        var animal:Animal?
        
        if type == "Duck" {
            animal = Duck(name:name, color:color, isMale: isMale)
        } else if type == "Fish" {
            animal =  Fish(name:name, color:color, isMale: isMale)
        } else if type == "Lion" {
            animal =  Lion(name:name, color:color, isMale: isMale)
        } else if type == "Seal" {
            animal =  Seal(name:name, color:color, isMale: isMale)
        } else if type == "Bear" {
            animal =  Bear(name:name, color:color, isMale: isMale)
        }
        
        let photoPath:String = json["photoFileName"].stringValue
        if !photoPath.isEmpty {
            animal?.photoFileName = photoPath
        }
        
        return animal
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

    public static func saveZoo(zoo:Zoo, toFileNamed name:String) -> Bool {
        let path = pathToFileInDocumentsDirectory(name + ".json")
        
        let json = JSON(zoo.toDictionary())
        let str = json.description
        
        do {
            try str.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
        }
        catch (let error){
            print(error)
            return false
        }
        return true
    }
    
}

//MARK: - Firebase helpers
extension ZooFactory {
    
    convenience init(snapshot: FDataSnapshot) {
        ref = snapshot.ref
    }
    
    func toAnyObject() -> AnyObject {
        return [
            "name": name,
            "addedByUser": addedByUser,
            "completed": completed
        ]
    }
}