//
//  Animal.swift
//  ZooKeeper
//
//  Created by hollarab on 2/4/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation
import UIKit
import Firebase

let dateFormatString = "dd-MMM-yy"

public class Animal {
    var type:String
    var name:String
    var color:String
    var isMale:Bool
    var currentWeight:Float?
    var birthday:NSDate?
    
    var key:String!
    var ref:Firebase?
    
    var photoFileName:String?
    
    init(type:String, name:String, color:String, isMale:Bool) {
        self.name = name
        self.type = type
        self.color = color
        self.isMale = isMale
        self.key = nil
    }
    
    init(snapshot: FDataSnapshot) {
        key = snapshot.key
        ref = snapshot.ref
        name = snapshot.value["name"] as! String
        type = snapshot.value["type"] as! String
        color = snapshot.value["color"] as! String
        isMale = snapshot.value["isMale"] as! Bool
        currentWeight = snapshot.value["currentWeight"] as? Float

        let formatter = NSDateFormatter()
        formatter.dateFormat = dateFormatString
        birthday = formatter.dateFromString(snapshot.value["birthday"] as! String)
    }
    
    deinit {
        print("Oh no!")
    }
    
    public func toDictionary() -> [String:AnyObject] {
        return [ "type" : type, "name" : name, "isMale" : isMale,
            "currentWeight":currentWeight ?? -1, "birthday" : birthdayDateString() ?? "",
                "color":color,  "photoFileName": photoFileName ?? ""]
    }
    
    private func birthdayDateString() -> String? {
        guard let day = birthday else {return nil}
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = dateFormatString
        return formatter.stringFromDate(day)
    }
    
    public static func dateFromString(string:String?) -> NSDate? {
        guard let string = string else {return nil}
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = dateFormatString
        return formatter.dateFromString(string)
    }
    
    public func report() -> String {
        return "I'm \(name) a \(isMale ? "boy" : "girl") \(color) \(type) Aminal"
    }
    
    public func defaultImageName() -> String {
        return type.lowercaseString
    }
    
    public func hasImage() -> Bool {
        return photoFileName != nil
    }
    
    public func saveImage(image:UIImage) -> Bool {
        if let data = UIImageJPEGRepresentation(image, 0.8) {
            photoFileName = NSUUID().UUIDString + ".jpg"
            let path = pathToFileInDocumentsDirectory(photoFileName!)
            print("writng to \(path)")
            return data.writeToFile(path, atomically: true)
        }
        return false
    }
    
    public func loadImage() -> UIImage? {
        print("reading from \(photoFileName ?? "no file")")
        guard let filename = photoFileName,
              let path = pathToExistingFileInDocumentsDirectory(filename),
              let image = UIImage(contentsOfFile: path) else { return nil }

        return image
    }
}

public class Duck : Animal {
    
    public init(name:String, color:String, isMale:Bool) {
        super.init(type:"Duck", name:name, color:color, isMale:isMale)
    }
    
    public func quack() {
        print("Quack")
    }
}

public class Fish : Animal {
    
    public init(name:String, color:String, isMale:Bool) {
        super.init(type:"Fish", name:name, color:color, isMale:isMale)
    }
    
    public func spawn() {
        print("long trip ahead...")
    }
}


public class Lion : Animal {
    
    public init(name:String, color:String, isMale:Bool) {
        super.init(type:"Lion", name:name, color:color, isMale:isMale)
    }
}


public class Seal : Animal {
    
    public init(name:String, color:String, isMale:Bool) {
        super.init(type:"Seal", name:name, color:color, isMale:isMale)
    }
}


public class Bear : Animal {
    
    public init(name:String, color:String, isMale:Bool) {
        super.init(type:"Bear", name:name, color:color, isMale:isMale)
    }
}
