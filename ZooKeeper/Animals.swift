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
    var imageBase64String:String?
    
    var key:String!
    var ref:Firebase?
    
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
        
        // when reading data, must decide to handle the optionals
        if let weight =  snapshot.value["currentWeight"] as? Float
            where weight > 0 {
                currentWeight = weight
        }
        
        if let bDayString = snapshot.value["birthday"] as? String
            where !bDayString.isEmpty {
                let formatter = NSDateFormatter()
                formatter.dateFormat = dateFormatString
                self.birthday = formatter.dateFromString(bDayString)
        }
        
        if let string = snapshot.value["imageBase64String"] as? String
            where !string.isEmpty {
                self.imageBase64String = string
        }
    }
    
    deinit {
        print("Oh no \(name)!")
    }
    
    public func toDictionary() -> [String:AnyObject] {
        return [
            "type" : type,
            "name" : name,
            "isMale" : isMale,
            "color":color,
            // Storing optionals - have to decide what "nil" means since we can't store that
            "currentWeight":currentWeight ?? -1,            // use -1 for no value
            "birthday" : birthdayDateString() ?? "",        // use empty string for no value
            "imageBase64String": imageBase64String ?? ""]   // use empty string for no value
    }
    
    public func updateInFB() {
        ref!.updateChildValues(toDictionary())
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
    
    public func saveImage(image:UIImage) -> Bool {
        if let smallImage = image.normalizedImage().scaledInside(CGSize(width: 500, height: 500)),
            let data = UIImageJPEGRepresentation(smallImage, 0.8) {
                let encodedString = data.base64EncodedStringWithOptions(.Encoding64CharacterLineLength)
                imageBase64String = encodedString
                ref!.updateChildValues(["imageBase64String":encodedString])
                let rootRef = ZooData.sharedInstance.rootRef
                let animalImagesRef = rootRef.childByAppendingPath("images/animals/\(key)")
                animalImagesRef.setValue(encodedString)
                
                return true
        }
        print("failed to turn image into data")
        return false
    }
    
    // NOTE: remove hasImage() and defaultImageName() functions
    
    /// Does a custom image exist for this animal?
    public func hasCustomImage() -> Bool {
        return imageBase64String != nil
    }
    
    /// Returns the custom image or default image
    public func getImage() -> UIImage? {
        if let image = firebaseImage()?.normalizedImage() {
            return image
        }
        return UIImage(named: type.lowercaseString)
    }
    
    private func firebaseImage() -> UIImage? {
        guard let string = imageBase64String,
            let data = NSData(base64EncodedString: string, options: .IgnoreUnknownCharacters),
            let image = UIImage(data: data) else { return nil }
        
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
