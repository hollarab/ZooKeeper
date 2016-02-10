//
//  Animal.swift
//  ZooKeeper
//
//  Created by hollarab on 2/4/16.
//  Copyright © 2016 a. brooks hollar. All rights reserved.
//

import Foundation

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
    
    init(type:String, name:String, color:String, isMale:Bool) {
        self.name = name
        self.type = type
        self.color = color
        self.isMale = isMale
    }
    
    deinit {
        print("Oh no!")
    }
    
    public func report() -> String {
        return "I'm \(name) a \(isMale ? "boy" : "girl") \(color) \(type) Aminal"
    }
    
    public func imageName() -> String {
        return type.lowercaseString
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
