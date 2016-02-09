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
