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
    var name:String
    var color:String
    var legCount:Int?
    var isMale:Bool
    
    init(name:String, color:String, isMale:Bool) {
        self.name = name
        self.color = color
        self.isMale = isMale
    }
    
    deinit {
        print("Oh no!")
    }
    
    public func report() -> String {
        return "I'm a \(isMale ? "boy" : "girl") \(color) \(name) Aminal"
    }
}

public class Duck : Animal, Quackable {
    
    public init(color:String, isMale:Bool) {
        super.init(name: "Duck", color:color, isMale:isMale)
        legCount = 2
    }
    
    public func quack() {
        print("Quack")
    }
}

public class Fish : Animal, Spawnable {
    
    public init(color:String, isMale:Bool) {
        super.init(name: "Fish", color:color, isMale:isMale)
        legCount = 0
    }
    
    public func spawn() {
        print("long trip ahead...")
    }
}
