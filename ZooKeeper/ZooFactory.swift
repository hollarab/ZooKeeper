//
//  ZooFactory.swift
//  ZooKeeper
//
//  Created by hollarab on 2/18/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation
import CoreData

public class ZooFactory {
    

    public static func insertAnimalsIntoContext(managedObjectContext:NSManagedObjectContext, fromFilename name:String) {
        
        // Check to see if we have one in the docs dir
        var storePath:String!
        
        if let path = pathToExistingFileInDocumentsDirectory(name + ".json") {
            print("loaded from docs dir")
            storePath = path
        } else if let path = NSBundle.mainBundle().pathForResource(name, ofType: "json"){
            print("loaded from bundle")
            storePath = path
        } else {
            return
        }
        
        if let contentData = NSFileManager.defaultManager().contentsAtPath(storePath) {
                
                let json = JSON(data: contentData)
                
                if let animals = json["animals"].array {
                    for json in animals {
        
                        let color:String = json["color"].stringValue
                        let type:String = json["type"].stringValue
                        let name:String = json["name"].stringValue
                        let isMale:Bool = json["isMale"].boolValue
                        
                        let animal = NSEntityDescription.insertNewObjectForEntityForName("Animal",
                            inManagedObjectContext: managedObjectContext) as! Animal
                        
                        animal.color = color
                        animal.type = type
                        animal.name = name
                        animal.isMale = isMale
                    }
                }
        }
    }
}
