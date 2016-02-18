//
//  Animal.swift
//  ZooKeeper
//
//  Created by hollarab on 2/4/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation
import UIKit

protocol Quackable {
    func quack()
}

protocol Spawnable {
    func spawn()
}

public class Animal {
    var type:String
    var name:String
    var color:String
    var isMale:Bool
    var currentWeight:Float?
    var birthday:NSDate?
    
    var photoFileName:String?
    
    init(type:String, name:String, color:String, isMale:Bool) {
        self.name = name
        self.type = type
        self.color = color
        self.isMale = isMale
    }
    
    deinit {
        print("Oh no!")
    }
    
    public func toDictionary() -> [String:AnyObject] {
        return [ "type" : type, "name" : name, "isMale" : isMale, "color":color,  "photoFileName": photoFileName ?? ""]
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

public class Duck : Animal, Quackable {
    
    public init(name:String, color:String, isMale:Bool) {
        super.init(type:"Duck", name:name, color:color, isMale:isMale)
    }
    
    public func quack() {
        print("Quack")
    }
}

public class Fish : Animal, Spawnable {
    
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
